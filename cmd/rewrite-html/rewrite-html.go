package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"golang.org/x/net/html"
)

var (
	inputHTMLFile  = flag.String("input_html_file", "ide.html", "The name of the input HTML file to rewrite.")
	outputHTMLFile = flag.String("output_html_file", "ide-bin.html", "The name of the output HTML file.")
	editsJSON      = flag.String("edits_json",
		`[{
				"selector": "script[src='ide.js']",
				"action": {"src": "bazel-bin/ide-bin.js"}
			}]`,
		"The edit instructions in JSON format. "+
			"The value should conform to the JSON serialization of []HTMLEdit. "+
			"The values that do not fit to []HTMLEdit are silently ignored.")
)

// HTMLEdit specifies one edit action to be performed on the HTML tree.
type HTMLEdit struct {
	// Selector is the CSS-style selector passed to Goquery.
	Selector string
	// Value is the string value or an HTML fragment to be used as a replacement.
	// "html" key is used to replace the selected element with a new fragment.
	// Other keys in action map are interpreted as attribute names.
	Action map[string]string
}

func render(node *html.Node) string {
	buf := new(bytes.Buffer)
	err := html.Render(buf, node)
	if err != nil {
		return fmt.Sprintf("<error: %s>", err)
	}
	return buf.String()
}

// Updates the HTML element tree in place according to a given instruction.
// NOTE: this method ignores namespaces.
func applyEdit(root *html.Node, edit HTMLEdit) error {
	doc := goquery.NewDocumentFromNode(root)
	s := doc.Find(edit.Selector)
	if len(s.Nodes) != 1 {
		return fmt.Errorf("selector %q matched %d notes, 1 expected.", edit.Selector, len(s.Nodes))
	}
	node := s.Nodes[0]
	log.Printf("Found node: %s", render(node))
	replacementHTML, ok := edit.Action["html"]
	if ok {
		if len(edit.Action) != 1 {
			return fmt.Errorf("cannot have both attribute and HTML replacement instructions")
		}
		nn, err := html.ParseFragment(strings.NewReader(replacementHTML), node.Parent)
		if err != nil {
			return fmt.Errorf("error parsing HTML fragment %q: %s", replacementHTML, err)
		}
		if len(nn) == 0 {
			return errors.New("empty HTML fragment given")
		}
		// Link the new nodes into instead of the given node.
		for i := range nn {
			if i == 0 {
				nn[i].PrevSibling = node.PrevSibling
			} else {
				nn[i].PrevSibling = nn[i-1]
			}
			if i < len(nn)-1 {
				nn[i].NextSibling = nn[i+1]
			} else {
				nn[i].NextSibling = node.NextSibling
			}
		}
		if node.Parent.FirstChild == node {
			node.Parent.FirstChild = nn[0]
		}
		if node.Parent.LastChild == node {
			node.Parent.LastChild = nn[len(nn)-1]
		}
		if node.PrevSibling != nil {
			node.PrevSibling.NextSibling = nn[0]
		}
		if node.NextSibling != nil {
			node.NextSibling.PrevSibling = nn[len(nn)-1]
		}
		return nil
	}
	// "html" key may be only the only key, so it is not present.
	done := make(map[string]bool)
	for i, attr := range node.Attr {
		value, ok := edit.Action[attr.Key]
		if ok {
			log.Printf("Rewriting attribute %s from %q to %q", attr.Key, attr.Val, value)
			node.Attr[i] = html.Attribute{Namespace: attr.Namespace, Key: attr.Key, Val: value}
			done[attr.Key] = true
		}
	}
	for key, value := range edit.Action {
		if done[key] {
			continue
		}
		log.Printf("Appending attribute %s with value %q", key, value)
		node.Attr = append(node.Attr, html.Attribute{Key: key, Val: value})
	}
	return nil
}

func run(input, output string, edits []HTMLEdit) error {
	b, err := ioutil.ReadFile(input)
	if err != nil {
		return fmt.Errorf("error reading %q: %s", input, err)
	}
	doc, err := html.Parse(bytes.NewBuffer(b))
	if err != nil {
		return fmt.Errorf("error parsing input HTML %q: %s", input, err)
	}
	for _, edit := range edits {
		err := applyEdit(doc, edit)
		if err != nil {
			return err
		}
	}
	outBuf := new(bytes.Buffer)
	err = html.Render(outBuf, doc)
	err = ioutil.WriteFile(output, outBuf.Bytes() /*perm*/, 0)
	if err != nil {
		return fmt.Errorf("error writing %q: %s", output, err)
	}
	fmt.Println("OK")
	return nil
}

func main() {
	flag.Parse()
	edits := []HTMLEdit{}
	err := json.Unmarshal([]byte(*editsJSON), &edits)
	if err != nil {
		log.Fatalf("Could parse --edits_json=%q: %s", *editsJSON, err)
	}
	log.Printf("Edits: %#v\n", edits)
	err = run(*inputHTMLFile, *outputHTMLFile, edits)
	if err != nil {
		log.Fatal("Could not rewrite %s to %s: %s", *inputHTMLFile, *outputHTMLFile, err)
	}
}
