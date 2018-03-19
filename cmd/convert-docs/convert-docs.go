package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"path"
	"strings"

	"github.com/PuerkitoBio/goquery"
	"golang.org/x/net/html"
)

var (
	referenceDir   = flag.String("reference_dir", "Z/processing-js.github.io/reference", "The path to the Processing.js reference dir.")
	outputHTMLFile = flag.String("output_html", "reference-docs.html",
		"The name of the output HTML file.")
)

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}

func render(node *html.Node) ([]byte, error) {
	buf := new(bytes.Buffer)
	err := html.Render(buf, node)
	if err != nil {
		return nil, fmt.Errorf("error rendering HTML: %s", err)
	}
	return buf.Bytes(), nil
}

func run() error {
	subdirs, err := ioutil.ReadDir(*referenceDir)
	if err != nil {
		return err
	}

	var children []*html.Node

	for _, fi := range subdirs {
		// The documentation is in subdirectory/index.html
		if !fi.IsDir() {
			continue
		}
		name := fi.Name()
		refName := name
		// TODO(salikh): fix overlaps.
		if strings.HasSuffix(refName, "_") {
			refName = refName[:len(refName)-1]
		}
		fmt.Println(refName)
		b, err := ioutil.ReadFile(path.Join(*referenceDir, fi.Name(), "index.html"))
		if err != nil {
			return err
		}
		if off1 := bytes.Index(b, []byte("---")); off1 >= 0 {
			if off2 := bytes.Index(b[off1+3:], []byte("---")); off2 >= 0 {
				b = b[off1+off2+6:]
			}
		}
		doc, err := html.Parse(bytes.NewBuffer(b))
		if err != nil {
			return err
		}
		qDoc := goquery.NewDocumentFromNode(doc)
		s := qDoc.Find("body")
		if len(s.Nodes) != 1 {
			return fmt.Errorf("selector 'body' returns unexpected number of elements: %d", len(s.Nodes))
		}
		elt := s.Nodes[0]
		// Overwrite.
		elt.Data = "div"
		elt.Attr = append(elt.Attr, html.Attribute{
			Key: "id",
			Val: "ref-" + refName,
		}, html.Attribute{
			Key: "class",
			Val: "section",
		})
		children = append(children, elt)
	}
	if len(children) < 2 {
		return fmt.Errorf("error: only %d reference articles found", len(children))
	}
	htmlElt := &html.Node{
		Type: html.ElementNode,
		Data: "html",
	}
	for i, elt := range children {
		if i > 0 {
			elt.PrevSibling = children[i-1]
		}
		if i < len(children)-1 {
			elt.NextSibling = children[i+1]
		}
		elt.Parent = htmlElt
	}
	htmlElt.FirstChild = children[0]
	htmlElt.LastChild = children[len(children)-1]
	refDoc := &html.Node{
		Type:       html.DocumentNode,
		FirstChild: htmlElt,
		LastChild:  htmlElt,
	}
	b, err := render(refDoc)
	if err != nil {
		return err
	}
	err = ioutil.WriteFile(*outputHTMLFile, b, 0775 /*perm*/)
	if err != nil {
		return err
	}
	return nil
}
