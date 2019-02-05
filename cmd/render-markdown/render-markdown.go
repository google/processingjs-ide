/*
Copyright 2018 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Binary render-markdown converts the online help markdown source
// into an HTML snippet to be pasted into ide.html.
package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"regexp"
	"strings"

	"golang.org/x/net/html"
	"gopkg.in/russross/blackfriday.v2"
)

var (
	inputMDFile    = flag.String("input_md_file", "", "The name of the Markdown file to read.")
	outputHTMLFile = flag.String("output_html_file", "", "The name of the output HTML file to write.")
)

func main() {
	flag.Parse()
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}

// Returns the concatenated direct text contents of a node.
func text(elt *html.Node) string {
	var r []string
	for ch := elt.FirstChild; ch != nil; ch = ch.NextSibling {
		if ch.Type == html.TextNode {
			r = append(r, ch.Data)
		}
	}
	return strings.Join(r, "")
}

func getData(n *html.Node) string {
	if n == nil {
		return "nil"
	}
	return n.Data
}

func run() error {
	if *inputMDFile == "" {
		return fmt.Errorf("Please specify --input_md_file")
	}
	if *outputHTMLFile == "" {
		return fmt.Errorf("Please specify --output_html_file")
	}
	cont, err := ioutil.ReadFile(*inputMDFile)
	if err != nil {
		return err
	}
	// First render the markdown into a first-pass HTML.
	rendered := blackfriday.Run(cont,
		blackfriday.WithExtensions(blackfriday.HeadingIDs|blackfriday.Titleblock|blackfriday.FencedCode),
		blackfriday.WithRefOverride(refOverride))
	// Parse the
	root, err := html.Parse(bytes.NewBuffer(rendered))
	if err != nil {
		return err
	}
	// We assume that markdown produces
	// <html><head></head><body> ... markdown content </body></html>.
	// If the asumptions on the HTML structure does not hold,
	// the code below will panic.
	htmlElt := root.FirstChild
	bodyElt := htmlElt.LastChild
	// Iterate over the children of the body element, split on <h1>
	// elements and wrap those into <div> and move the ids from
	// <h1> elements to div>.
	var divElt *html.Node
	var divElts []*html.Node
	for elt := bodyElt.FirstChild; elt != nil; elt = elt.NextSibling {
		// Split into sections on h1.
		if elt.Data == "h1" {
			prevDiv := divElt
			if len(elt.Attr) == 0 {
				elt.Attr = append(elt.Attr, html.Attribute{Key: "id", Val: "ref-" + text(elt)})
			}
			divElt = &html.Node{
				Type:        html.ElementNode,
				Data:        "div",
				PrevSibling: prevDiv,
				// NextSibling will be filled in later.
				FirstChild: elt,
				// LastChild will be repeatedly overwritten below..
				Parent: bodyElt,
				// Copy the id attr from <h1> and add class='section'.
				Attr: append(elt.Attr, html.Attribute{Key: "class", Val: "section"}),
			}
			if prevDiv != nil {
				prevDiv.LastChild.NextSibling = nil
				prevDiv.NextSibling = divElt
			}
			divElts = append(divElts, divElt)
			// Remove the id attr from <h1>.
			elt.Attr = nil
			elt.Parent = divElt
			elt.PrevSibling = nil
			// We overwrite LastChild on each iteration, so eventually
			// it really will be pointing the last child.
			divElt.LastChild = elt
		} else {
			elt.Parent = divElt
			// We overwrite LastChild on each iteration, so eventually
			// it really will be pointing the last child.
			divElt.LastChild = elt
		}
	}
	bodyElt.FirstChild = divElts[0]
	bodyElt.LastChild = divElts[len(divElts)-1]
	// Add the <meta charset="UTF-8">.
	if htmlElt.FirstChild == nil || htmlElt.FirstChild.Data != "head" {
		return fmt.Errorf("render-markdown's assumption broken, expected <head> as first child of <html>, got <%s> > <%s>",
			getData(htmlElt), getData(htmlElt.FirstChild))
	}
	headElt := htmlElt.FirstChild
	meta := &html.Node{
		Type: html.ElementNode,
		Data: "meta",
		Attr: []html.Attribute{{Key: "charset", Val: "UTF-8"}},
	}
	if headElt.FirstChild == nil {
		headElt.FirstChild = meta
		headElt.LastChild = meta
	} else {
		meta.NextSibling = headElt.FirstChild
		headElt.FirstChild = meta
		meta.Parent = headElt
	}
	// Render the modified HTML tree back into []byte.
	buf := new(bytes.Buffer)
	err = html.Render(buf, root)
	if err != nil {
		return fmt.Errorf("error rendering HTML: %s", err)
	}
	err = ioutil.WriteFile(*outputHTMLFile, buf.Bytes(), os.FileMode(0775))
	if err != nil {
		return err
	}
	return nil
}

var identRegex = regexp.MustCompile("^([a-zA-Z_][a-zA-Z0-9_]*)(\\(\\))?$")

func refOverride(reference string) (*blackfriday.Reference, bool) {
	if m := identRegex.FindStringSubmatch(reference); len(m) > 0 {
		return &blackfriday.Reference{
			Link: "#ref-" + m[1],
		}, true
	}
	return nil, false
}
