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
	rendered := blackfriday.Run(cont, blackfriday.WithExtensions(blackfriday.HeadingIDs|blackfriday.Titleblock))
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
