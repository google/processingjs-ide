package main

import (
	"flag"
	"net/http"
)

var (
	dir = flag.String("dir", ".", "The directory to serve.")
)

func main() {
	flag.Parse()
	panic(http.ListenAndServe(":8080", http.FileServer(http.Dir(*dir))))
}
