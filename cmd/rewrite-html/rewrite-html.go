// Binary rewrite-html is an ad-hoc purpose build utility
// to manipulate HTML source of ide.html.
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
	// Selector is the CSS-style selector passed to Goquery to identify
	// the HTML element to apply edits to.
	Selector string
	// Attr is a map from attr name to value.
	Attr map[string]string
	// HTML fragment to be used as a replacement for the target
	// element. If empty, ignored.
	HTML string
	// The HTML fragment to replace the content of the target the
	// element. If empty, ignored.
	Content string
	// The path to the HTML file to be loaded. If empty, ignored.
	File string
	// The selector to cut the fragment from the loaded HTML.
	FileSelector string
}

func render(node *html.Node) string {
	buf := new(bytes.Buffer)
	err := html.Render(buf, node)
	if err != nil {
		return fmt.Sprintf("<error: %s>", err)
	}
	return buf.String()
}

// parseHTMLFragment parses a HTML snippet into a list of nodes.
func parseHTMLFragment(fragment string, parent *html.Node) ([]*html.Node, error) {
	nn, err := html.ParseFragment(strings.NewReader(fragment), parent)
	if err != nil {
		return nil, fmt.Errorf("error parsing HTML fragment %q: %s", fragment, err)
	}
	if len(nn) == 0 {
		return nil, errors.New("empty HTML fragment given")
	}
	return nn, nil
}

func extractHTMLFragment(file, selector string) ([]*html.Node, error) {
	b, err := ioutil.ReadFile(file)
	if err != nil {
		return nil, fmt.Errorf("error reading %q: %s", file, err)
	}
	root, err := html.Parse(bytes.NewBuffer(b))
	if err != nil {
		return nil, fmt.Errorf("error parsing HTML file %q: %s", file, err)
	}
	doc := goquery.NewDocumentFromNode(root)
	log.Print(render(root))
	s := doc.Find(selector)
	log.Printf("extracted %d nodes from file %q", len(s.Nodes), file)
	return s.Nodes, nil
}

// replaceElement replaces the element with a list of replacement
// nodes.
func replaceElement(node *html.Node, nn []*html.Node) {
	if len(nn) == 0 {
		// Just cut out the element.
		if node.PrevSibling != nil {
			node.PrevSibling.NextSibling = node.NextSibling
		}
		if node.NextSibling != nil {
			node.NextSibling.PrevSibling = node.PrevSibling
		}
		return
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
	if node.Parent.FirstChild == node && len(nn) > 0 {
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
}

// replaceContent replaces the children of the node
// with the replacement nodes nn.
func replaceContent(node *html.Node, nn []*html.Node) {
	if len(nn) == 0 {
		node.FirstChild = nil
		node.LastChild = nil
		return
	}
	// Link the new nodes into instead of the given node.
	for i := range nn {
		if i == 0 {
			nn[i].PrevSibling = nil
		} else {
			nn[i].PrevSibling = nn[i-1]
		}
		if i < len(nn)-1 {
			nn[i].NextSibling = nn[i+1]
		} else {
			nn[i].NextSibling = nil
		}
		nn[i].Parent = node
	}
	node.FirstChild = nn[0]
	node.LastChild = nn[len(nn)-1]
}

// Updates the HTML element tree in place according to a given
// instruction.
// NOTE: this method ignores namespaces.
func applyEdit(root *html.Node, edit HTMLEdit) error {
	doc := goquery.NewDocumentFromNode(root)
	s := doc.Find(edit.Selector)
	if len(s.Nodes) != 1 {
		return fmt.Errorf("selector %q matched %d notes, 1 expected.", edit.Selector, len(s.Nodes))
	}
	node := s.Nodes[0]
	log.Printf("Found node: %s", render(node))
	if edit.HTML != "" {
		nn, err := parseHTMLFragment(edit.HTML, node.Parent)
		if err != nil {
			return err
		}
		replaceElement(node, nn)
		return nil
	}
	if edit.Content != "" {
		// Replace the content of the selected element.
		nn, err := parseHTMLFragment(edit.Content, node)
		if err != nil {
			return err
		}
		replaceContent(node, nn)
	}
	if edit.File != "" {
		nn, err := extractHTMLFragment(edit.File, edit.FileSelector)
		if err != nil {
			return err
		}
		replaceContent(node, nn)
	}
	// The rest of actions are attribute edit actions.
	done := make(map[string]bool)
	for i, attr := range node.Attr {
		value, ok := edit.Attr[attr.Key]
		if ok {
			log.Printf("Rewriting attribute %s from %q to %q", attr.Key, attr.Val, value)
			node.Attr[i] = html.Attribute{Namespace: attr.Namespace, Key: attr.Key, Val: value}
			done[attr.Key] = true
		}
	}
	for key, value := range edit.Attr {
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
	log.Println("OK")
	return nil
}

func main() {
	flag.Parse()
	edits := []HTMLEdit{}
	err := json.Unmarshal([]byte(*editsJSON), &edits)
	if err != nil {
		log.Fatalf("Could not parse --edits_json=%s: %s", *editsJSON, err)
	}
	log.Printf("Edits: %#v\n", edits)
	err = run(*inputHTMLFile, *outputHTMLFile, edits)
	if err != nil {
		log.Fatal("Could not rewrite %s to %s: %s", *inputHTMLFile, *outputHTMLFile, err)
	}
}
