# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@io_bazel_rules_closure//closure:defs.bzl", "closure_js_binary")
load("@io_bazel_rules_closure//closure:defs.bzl", "closure_js_library")
load("@io_bazel_rules_closure//closure:defs.bzl", "closure_js_deps")

closure_js_library(
    name = "ide-js",
    srcs = [
        "codemirror-externs.js",
        "ide.js",
        "processing-externs.js",
        "@closure_compiler//:contrib/externs/jquery-3.2.js",
    ],
)

closure_js_binary(
    name = "ide-bin",
    deps = [
        ":ide-js",
    ],
)

# A HTML rewritten to be loaded from a flat static directory.
genrule(
    name = "ide-html-bin",
    srcs = [
        "ide.html",
    ],
    outs = ["ide-bin.html"],
    cmd = """./$(location //cmd/rewrite-html) --input_html_file="$<" --output_html_file="$@" """ +
          """--edits_json='[
	    {"selector": "script[src=\\"ide.js\\"]", "action": {"src": "ide-bin.js"}},
	    {"selector": "body > h1", "action": {"html": "<h1>ide-bin.html (Built)</h1>"}},
	    {"selector": "script[src$$=\\"jquery.js\\"]", "action": {"src": "jquery.min.js"}},
	    {"selector": "script[src$$=\\"codemirror.js\\"]", "action": {"src": "codemirror.js"}},
	    {"selector": "script[src$$=\\"/lint.js\\"]", "action": {"src": "lint.js"}},
	    {"selector": "link[href$$=\\"codemirror.css\\"]", "action": {"href": "codemirror.css"}},
	    {"selector": "link[href$$=\\"lint.css\\"]", "action": {"href": "lint.css"}},
	    {"selector": "script[src$$=\\"clike.js\\"]", "action": {"src": "clike.js"}},
	    {"selector": "script[src$$=\\"processing.js\\"]", "action": {"src": "processing.js"}},
	    {"selector": "link[href$$=\\"style.css\\"]", "action": {"href": "style.css"}},
	    {"selector": "script[src$$=\\"grammars/toplevel.js\\"]", "action": {"src": "toplevel.js"}}
	  ]'""",
    tools = ["//cmd/rewrite-html"],
)

genrule(
    name = "static-files",
    srcs = [
        "third_party/processing-js/processing.min.js",
	":ide-bin",
	":ide-html-bin",
        "@jquery//:dist/jquery.min.js",
	"static/style.css",
	"node_modules/codemirror/lib/codemirror.js",
	"node_modules/codemirror/addon/lint/lint.js",
	"node_modules/codemirror/lib/codemirror.css",
	"node_modules/codemirror/addon/lint/lint.css",
	"node_modules/codemirror/mode/clike/clike.js",
	"third_party/processing-js/processing.js",
	"processingjs-lint.js",
	"grammars/toplevel.js",
    ],
    outs = ["static"],
    cmd = """mkdir -v -p "$@"; cp -v $(SRCS) "$@"/""",
)

