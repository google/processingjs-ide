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
