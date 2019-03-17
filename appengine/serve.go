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
	"strings"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
	"github.com/salikh/processingjs-ide/db"
	"github.com/salikh/processingjs-ide/tts"
	"golang.org/x/net/context"
	"google.golang.org/appengine"
	"google.golang.org/appengine/memcache"
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
	r.Methods("GET").Path("/recent").Handler(appHandler(recentHandler))
	r.Methods("GET").Path("/sketch/{id}").Handler(appHandler(sketchGetHandler))
	r.Methods("POST").Path("/sketch").Handler(appHandler(sketchPostHandler))
	r.Methods("POST").Path("/sketch/{id}").Handler(appHandler(sketchPostHandler))
	r.Methods("POST").Path("/tts").Handler(appHandler(ttsPostHandler))
	r.Methods("GET").Path("/tts/{lang}/{text}").Handler(appHandler(ttsGetHandler))
	r.Methods("GET").Path("/tts/{lang}").Handler(appHandler(ttsGetHandler))

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

func recentHandler(w http.ResponseWriter, req *http.Request) error {
	session, err := sessionStore.Get(req, sessionName)
	if err != nil {
		return err
	}
	recent, _ := session.Values["recent"].(string)
	if len(recent) == 0 {
		return fmt.Errorf("no recent sketches")
	}
	ids := strings.Split(recent, ",")
	sketches := make([]*db.Sketch, 0, len(ids))
	for _, idStr := range ids {
		if idStr == "" {
			continue
		}
		id, err := db.ParseID(idStr)
		if err != nil {
			return fmt.Errorf("error parsing ID %q: %s", idStr, err)
		}
		sketches = append(sketches, &db.Sketch{ID: id, Title: idStr})
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
	re := regexp.MustCompile("//[ \t\\p{P}\\p{Z}]*([\\p{L}\\p{M}\\p{N}_-]*)")
	if m := re.FindSubmatch(sketch.Source); m != nil {
		sketch.Title = string(m[1])
	}
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
		recentStr, _ := session.Values["recent"].(string)
		recent := strings.Split(recentStr, ",")
		if len(recent) > 9 {
			recent = recent[1:len(recent)]
		}
		recent = append(recent, id.String())
		session.Values["recent"] = strings.Join(recent, ",")
	}
	session.Values["sketch"] = id.String()
	if err := session.Save(req, w); err != nil {
		log.Printf("error saving session: %s", err)
		// Do not fail the request to user on failure to set cookie.
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

func ttsPostHandler(w http.ResponseWriter, req *http.Request) error {
	err := req.ParseMultipartForm(10240)
	if err != nil {
		return fmt.Errorf("invalid form submission: %s", err)
	}
	text := html.UnescapeString(req.FormValue("text"))
	lang := html.UnescapeString(req.FormValue("lang"))
	return ttsCommon(w, req, text, lang)
}

func ttsGetHandler(w http.ResponseWriter, req *http.Request) error {
	err := req.ParseForm()
	if err != nil {
		return err
	}
	vars := mux.Vars(req)
	lang, err := url.QueryUnescape(vars["lang"])
	if err != nil {
		return fmt.Errorf("invalid lang %q: %s", lang, err)
	}
	text, err := url.QueryUnescape(vars["text"])
	if text == "" {
		text, err = url.QueryUnescape(req.FormValue("text"))
	}
	if err != nil {
		return fmt.Errorf("invalid text %q: %s", text, err)
	}
	return ttsCommon(w, req, text, lang)
}

func ttsCommon(w http.ResponseWriter, req *http.Request, text, lang string) error {
	ctx := appengine.NewContext(req)
	if len(text) > 240 {
		return fmt.Errorf("input text too long, must be under 240 bytes")
	}
	cacheKey := text + ":" + lang
	item, err := memcache.Get(ctx, cacheKey)
	if err != nil && err != memcache.ErrCacheMiss {
		return err
	}
	if err == nil {
		// Cache hit.
		w.Header()["Content-Type"] = []string{"audio/mp3"}
		w.Write(item.Value)
		return nil
	}
	log.Printf("Cache miss for %q", cacheKey)
	// Cache miss, query the TTS API.
	wave, err := tts.TextToMP3(ctx, text, lang)
	if err != nil {
		return err
	}
	w.Header()["Content-Type"] = []string{"audio/mp3"}
	w.Write(wave)
	item = &memcache.Item{
		Key:   cacheKey,
		Value: wave,
	}
	// Ignore error.
	_ = memcache.Add(ctx, item)
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
