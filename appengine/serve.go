// Copyright 2018 Google Inc. All rights reserved.
// Use of this source code is governed by the Apache 2.0
// license that can be found in the LICENSE file.

// This is an Go Appengine app that supports the Processing.js IDE.
package main

import (
	"fmt"
	"html"
	"html/template"
	"log"
	"net/http"
	"net/url"
	"os"
	"regexp"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
	"github.com/salikh/processingjs-ide/db"
	"golang.org/x/net/context"
	"google.golang.org/appengine"
)

var (
	sessionStore = sessions.NewCookieStore([]byte("secret-27c789e1a8b844742e035"))
	dataStore    db.Database
)

type appHandler func(w http.ResponseWriter, req *http.Request) error

type appError struct {
	Message string
	Code    int
}

func (e *appError) Error() string {
	return fmt.Sprintf("%d Internal app error, %s", e.Code, e.Message)
}

func (handler appHandler) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	err := handler(w, req)
	if err == nil {
		return
	}
	log.Printf("Server error: %s", err)
	if e, ok := err.(*appError); ok {
		http.Error(w, e.Message, e.Code)
	} else {
		http.Error(w, fmt.Sprintf("Internal app error: %s", err), http.StatusInternalServerError)
	}
}

func main() {
	r := mux.NewRouter()
	r.Methods("GET").Path("/").Handler(appHandler(indexHandler))
	r.Methods("GET").Path("/list").Handler(appHandler(listHandler))
	r.Methods("GET").Path("/sketch/{id}").Handler(appHandler(sketchGetHandler))
	r.Methods("POST").Path("/sketch").Handler(appHandler(sketchPostHandler))
	r.Methods("POST").Path("/sketch/{id}").Handler(appHandler(sketchPostHandler))
	r.Methods("POST").Path("/tts").Handler(appHandler(ttsHandler))

	http.Handle("/", handlers.CombinedLoggingHandler(os.Stderr, r))
	appengine.Main()
}

// A quick switch for the data store.
func newDatastore(ctx context.Context) (db.Database, error) {
	// Use this for Cloud datastore.
	return db.NewDatastore(ctx, db.GetProjectID(ctx))
	// Use this for testing.
	//return db.NewMemoryDB(), nil
}

const sessionName = "pjs"

var sketchListHTML = `
<!DOCTYPE html>
<title>Sketch list</title>
<p><a href='/'>Create new</a></p>
{{range .}}
<a href='/static/ide-ja.html#sketch={{.ID}}'>{{if .Title}}{{.Title}}{{else}}sketch{{end}}</a>
{{else}}
0 sketches
{{end}}
`
var sketchListTmpl = template.Must(template.New("sketchList").Parse(sketchListHTML))

// listHandler retrieves the list of sketches and shows the links.
func listHandler(w http.ResponseWriter, req *http.Request) error {
	ctx := appengine.NewContext(req)
	if dataStore == nil {
		var err error
		dataStore, err = newDatastore(ctx)
		if err != nil {
			return fmt.Errorf("could not connect to DataStore: %s", err)
		}
	}
	sketches, err := dataStore.ListSketches(ctx)
	if err != nil {
		return fmt.Errorf("error listing sketches: %s", err)
	}
	sketchListTmpl.Execute(w, sketches)
	return nil
}

func sketchPostHandler(w http.ResponseWriter, req *http.Request) error {
	ctx := appengine.NewContext(req)
	session, err := sessionStore.Get(req, sessionName)
	if err != nil {
		return err
	}
	if dataStore == nil {
		var err error
		dataStore, err = newDatastore(ctx)
		if err != nil {
			return fmt.Errorf("could not connect to DataStore %q: %s", db.GetProjectID(ctx), err)
		}
	}
	err = req.ParseForm()
	if err != nil {
		return fmt.Errorf("invalid form submission: %s", err)
	}
	sketch := &db.Sketch{}
	vars := mux.Vars(req)
	idstr := vars["id"]
	if idstr != "" {
		id, err := db.ParseID(idstr)
		if err != nil {
			return fmt.Errorf("error parsing sketch id %q: %s", idstr, err)
		}
		sketch, err = dataStore.GetSketch(ctx, id)
		if err != nil {
			return fmt.Errorf("Sketch %d does not exist: %s", id, err)
		}
	}
	sketch.Source = []byte(req.PostFormValue("source"))
	if len(sketch.Source) == 0 {
		sketch.Source = []byte(req.FormValue("source"))
	}
	// Extract the sketch name.
	re := regexp.MustCompile("// *([a-zA-Z_-]*)")
	if m := re.FindSubmatch(sketch.Source); m != nil {
		sketch.Title = string(m[1])
	}
	log.Printf("source = %q", sketch.Source)
	var id db.ID
	if sketch.ID != 0 {
		err = dataStore.UpdateSketch(ctx, sketch)
		if err != nil {
			return fmt.Errorf("Error updating sketch %d: %s", sketch.ID, err)
		}
		id = sketch.ID
	} else {
		var err error
		id, err = dataStore.CreateSketch(ctx, sketch)
		if err != nil {
			return fmt.Errorf("Error creating sketch: %s", err)
		}
	}
	session.Values["sketch"] = id.String()
	if err := session.Save(req, w); err != nil {
		return err
	}
	// Return the new sketch id in the response.
	fmt.Fprintf(w, id.String())
	return nil
}

func sketchGetHandler(w http.ResponseWriter, req *http.Request) error {
	ctx := appengine.NewContext(req)
	if dataStore == nil {
		var err error
		dataStore, err = newDatastore(ctx)
		if err != nil {
			return fmt.Errorf("could not connect to DataStore: %s", err)
		}
	}
	vars := mux.Vars(req)
	idstr := vars["id"]
	if idstr == "" {
		return fmt.Errorf("invalid empty sketch id")
	}
	id, err := db.ParseID(idstr)
	if err != nil {
		return fmt.Errorf("error parsing sketch id %q: %s", idstr, err)
	}
	sketch, err := dataStore.GetSketch(ctx, id)
	if err != nil {
		return fmt.Errorf("Sketch %d does not exist: %s", id, err)
	}
	w.Header()["Content-Type"] = []string{"text/plain; charset=utf-8"}
	if _, err := w.Write(sketch.Source); err != nil {
		return err
	}
	return nil
}

func ttsHandler(w http.ResponseWriter, req *http.Request) error {
	err := req.ParseForm()
	if err != nil {
		return fmt.Errorf("invalid form submission: %s", err)
	}
	text := req.FormValue("text")
	fmt.Fprintf(w, "<!DOCTYPE html><pre>%s</pre>", html.EscapeString(text))
	return nil
}

func indexHandler(w http.ResponseWriter, req *http.Request) error {
	session, err := sessionStore.Get(req, sessionName)
	if err != nil {
		return err
	}
	idstr, ok := session.Values["sketch"]
	if ok {
		http.Redirect(w, req, fmt.Sprintf("/static/ide-ja.html#sketch=%s",
			url.PathEscape(idstr.(string))), http.StatusFound)
	} else {
		http.Redirect(w, req, "/static/ide-ja.html", http.StatusFound)
	}
	return nil
}
