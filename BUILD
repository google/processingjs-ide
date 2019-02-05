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
        "//grammars:toplevel-externs.js",
        "@closure_compiler//:contrib/externs/jquery-3.2.js",
    ],
    suppress = ["reportUnknownTypes"],
    deps = [
        ":lint-js",
    ],
)

closure_js_binary(
    name = "ide-bin",
    deps = [
        ":ide-js",
    ],
)

genrule(
    name = "docs-en-html",
    srcs = [
        "docs/en.md",
    ],
    outs = ["docs-en.html"],
    cmd = """$(location //cmd/render-markdown) --input_md_file="$<" --output_html_file="$@" """,
    tools = ["//cmd/render-markdown"],
)

genrule(
    name = "docs-ja-html",
    srcs = [
        "docs/ja.md",
    ],
    outs = ["docs-ja.html"],
    cmd = """$(location //cmd/render-markdown) --input_md_file="$<" --output_html_file="$@" """,
    tools = ["//cmd/render-markdown"],
)

# A HTML rewritten to be loaded from a flat static directory.
genrule(
    name = "ide-html-bin",
    srcs = [
        "ide.html",
        "ga.html",
    ],
    outs = ["ide-bin.html"],
    cmd = """./$(location //cmd/rewrite-html) --input_html_file="$(location ide.html)" --output_html_file="$@" """ +
          """--edits_json='[
            {"selector": "script[src$$=\\"base.js\\"]", "file": "$(location ga.html)", "fileselector": "script"},
            {"selector": "script[src=\\"lint.js\\"]"},
            {"selector": "script[src=\\"ide.js\\"]", "attr": {"src": "ide-bin.js"}},
            {"selector": "title:content", "html": "Processing.js IDE"},
            {"selector": "body > h1 :content", "html": "Processing.js IDE"},
            {"selector": "script[src$$=\\"jquery.js\\"]", "attr": {"src": "jquery.min.js"}},
            {"selector": "script[src$$=\\"codemirror.js\\"]", "attr": {"src": "codemirror.js"}},
            {"selector": "script[src$$=\\"/lint.js\\"]", "attr": {"src": "lint.js"}},
            {"selector": "link[href$$=\\"codemirror.css\\"]", "attr": {"href": "codemirror.css"}},
            {"selector": "link[href$$=\\"eclipse.css\\"]", "attr": {"href": "eclipse.css"}},
            {"selector": "link[href$$=\\"lint.css\\"]", "attr": {"href": "lint.css"}},
            {"selector": "script[src$$=\\"clike.js\\"]", "attr": {"src": "clike.js"}},
            {"selector": "script[src$$=\\"processing.js\\"]", "attr": {"src": "processing.js"}},
            {"selector": "link[href$$=\\"style.css\\"]", "attr": {"href": "style.css"}},
            {"selector": "script[src$$=\\"grammars/toplevel.js\\"]", "attr": {"src": "toplevel.pegjs.js"}},
            {"selector": "a[href$$=\\"terms.html\\"]", "attr": {"href": "terms.html"}}, 
            {"selector": "div#reference:content", "file": "$(location :docs-en.html)", "fileselector": "body:content"},
            {"selector": "div#help_div:content", "file": "$(location :docs-en.html)", "fileselector": "div#ref-help"}
        ]'""",
    tools = [
        ":docs-en.html",
        "//cmd/rewrite-html",
    ],
)

genrule(
    name = "ide-html-ja",
    srcs = [
        "ide.html",
        "ga.html",
    ],
    outs = ["ide-ja.html"],
    cmd = """./$(location //cmd/rewrite-html) --input_html_file="$(location ide.html)" --output_html_file="$@" """ +
          """--edits_json='[
            {"selector": "script[src$$=\\"base.js\\"]", "file": "$(location ga.html)", "fileselector": "script"},
            {"selector": "script[src=\\"lint.js\\"]"},
            {"selector": "script[src=\\"ide.js\\"]", "attr": {"src": "ide-bin.js"}},
            {"selector": "title:content", "html": "Processing.js IDE"},
            {"selector": "body > h1 :content", "html": "Processing.js IDE"},
            {"selector": "script[src$$=\\"jquery.js\\"]", "attr": {"src": "jquery.min.js"}},
            {"selector": "script[src$$=\\"codemirror.js\\"]", "attr": {"src": "codemirror.js"}},
            {"selector": "script[src$$=\\"/lint.js\\"]", "attr": {"src": "lint.js"}},
            {"selector": "link[href$$=\\"codemirror.css\\"]", "attr": {"href": "codemirror.css"}},
            {"selector": "link[href$$=\\"eclipse.css\\"]", "attr": {"href": "eclipse.css"}},
            {"selector": "link[href$$=\\"lint.css\\"]", "attr": {"href": "lint.css"}},
            {"selector": "script[src$$=\\"clike.js\\"]", "attr": {"src": "clike.js"}},
            {"selector": "script[src$$=\\"processing.js\\"]", "attr": {"src": "processing.js"}},
            {"selector": "link[href$$=\\"style.css\\"]", "attr": {"href": "style.css"}},
            {"selector": "script[src$$=\\"grammars/toplevel.js\\"]", "attr": {"src": "toplevel.pegjs.js"}},
            {"selector": "a[href$$=\\"terms.html\\"]", "attr": {"href": "terms.html"}}, 
            {"selector": "div#reference:content", "file": "$(location :docs-ja.html)", "fileselector": "body:content"},
            {"selector": "div#help_div:content", "file": "$(location :docs-ja.html)", "fileselector": "div#ref-help"}
        ]'""",
    tools = [
        ":docs-ja.html",
        "//cmd/rewrite-html",
    ],
)

genrule(
    name = "static-files",
    srcs = [
        "third_party/processing-js/processing.min.js",
        ":ide-bin",
        ":ide-html-bin",
        ":ide-html-ja",
        ":docs-ja-html",
        ":docs-en-html",
        "@jquery//:dist/jquery.min.js",
        "node_modules/codemirror/lib/codemirror.js",
        "node_modules/codemirror/addon/lint/lint.js",
        "node_modules/codemirror/lib/codemirror.css",
        "node_modules/codemirror/theme/eclipse.css",
        "node_modules/codemirror/addon/lint/lint.css",
        "node_modules/codemirror/mode/clike/clike.js",
        "third_party/processing-js/processing.js",
        "//grammars:toplevel.pegjs.js",
    ] + glob(["static/*"]),
    outs = ["static"],
    cmd = """mkdir -v -p "$@"; cp -v $(SRCS) "$@"/""",
)

closure_js_library(
    name = "lint-js",
    srcs = [
        "lint.js",
    ],
    suppress = [
        "reportUnknownTypes",
        "checkTypes",
    ],
)

load("//:defs.bzl", "mocha_test")

mocha_test(
    name = "lint_test",
    src = "lint_test.js",
    data = [
        "lint.js",
        "//grammars:toplevel",
        "@npm//google-closure-library",
    ],
)
