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

// Binary server is a simple HTTP server for static files
// based on Go standard http library.
//
// Usage:
//
//   go run cmd/server/server.go --dir bazel-genfiles/static
//
// Or, with Bazel:
//
//   bazel build cmd/server
//   bazel-bin/cmd/server/linux_amd64_stripped/server --dir .
//
// Then visit http://localhost:8080/ to get access to ide.html via HTTP.
//
package main

import (
	"flag"
	"fmt"
	"net/http"
)

var (
	dir  = flag.String("dir", "bazel-genfiles", "The directory to serve.")
	port = flag.Int("port", 8080, "The port to listen on.")
)

func main() {
	flag.Parse()
	addr := fmt.Sprintf(":%d", *port)
	fmt.Printf("\n\tListening on http://localhost%s/\n\n", addr)
	panic(http.ListenAndServe(addr, http.FileServer(http.Dir(*dir))))
}
