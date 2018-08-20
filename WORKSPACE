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

#
# Bazel rules for Closure compiler.
#
http_archive(
    name = "io_bazel_rules_closure",
    sha256 = "a80acb69c63d5f6437b099c111480a4493bad4592015af2127a2f49fb7512d8d",
    strip_prefix = "rules_closure-0.7.0",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_closure/archive/0.7.0.tar.gz",
        "https://github.com/bazelbuild/rules_closure/archive/0.7.0.tar.gz",
    ],
)

load("@io_bazel_rules_closure//closure:defs.bzl", "closure_repositories")

closure_repositories()

#
# Import Processing.js from a minimal distribution under third_party/.
#
new_local_repository(
    name = "processing_js",
    build_file = "third_party/processing-js.BUILD",
    path = "third_party",
)

#
# Import jQuery.
#
new_http_archive(
    name = "jquery",
    build_file = "third_party/jquery.BUILD",
    strip_prefix = "jquery-3.2.1",
    urls = ["https://github.com/jquery/jquery/archive/3.2.1.tar.gz"],
)

#
# Import Closure compiler to use contrib/externs.
#
new_http_archive(
    name = "closure_compiler",
    build_file = "third_party/closure-compiler.BUILD",
    sha256 = "e7d5f24a9ba38b84294c8acc866a9d4ba0da03f297655d588d33d982cb6133f8",
    strip_prefix = "closure-compiler-20180101",
    url = "https://github.com/google/closure-compiler/archive/v20180101.tar.gz",
)

#
# Bazel rules for Go compiler.
#
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "c1f52b8789218bb1542ed362c4f7de7052abcf254d865d96fb7ba6d44bc15ee3",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.12.0/rules_go-0.12.0.tar.gz",
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "ddedc7aaeb61f2654d7d7d4fd7940052ea992ccdb031b8f9797ed143ac7e8d43",
    url = "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.12.0/bazel-gazelle-0.12.0.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

gazelle_dependencies()

#
# Import dependencies of Goquery.
#
go_repository(
    name = "com_github_andybalholm_cascadia",
    commit = "349dd0209470eabd9514242c688c403c0926d266",
    importpath = "github.com/andybalholm/cascadia",
    remote = "https://github.com/andybalholm/cascadia.git",
    vcs = "git",
)

#
# Import Goquery.
#
go_repository(
    name = "com_github_PuerkitoBio_goquery",
    importpath = "github.com/PuerkitoBio/goquery",
    sha256 = "8242ca59ecb79aada1463ee327304953ad49bb5053807e79e2ad07e8d70a00c6",
    strip_prefix = "goquery-1.1.0",
    urls = ["https://github.com/PuerkitoBio/goquery/archive/v1.1.0.tar.gz"],
)

#
# Import golang.org/x/net/html
#
go_repository(
    name = "com_github_golang_net",
    commit = "42fe2e1c20de1054d3d30f82cc9fb5b41e2e3767",
    importpath = "golang.org/x/net",
    remote = "https://github.com/golang/net.git",
    vcs = "git",
)

#
# Import gopkg.in/russross/blackfriday.v2
#
go_repository(
    name = "com_github_russross_blackfriday",
    commit = "cadec560ec52d93835bf2f15bd794700d3a2473b",
    importpath = "gopkg.in/russross/blackfriday.v2",
    remote = "https://github.com/russross/blackfriday",
    vcs = "git",
)

#
# Import github.com/shurcool/sanitized_anchor_name, a dependency of blackfriday.
#
go_repository(
    name = "com_github_shurcool_sanitized_anchor_name",
    commit = "86672fcb3f950f35f2e675df2240550f2a50762f",
    importpath = "github.com/shurcooL/sanitized_anchor_name",
    remote = "https://github.com/shurcooL/sanitized_anchor_name",
    vcs = "git",
)

#
# Bazel rules for yarn modules and nodejs tests (Mocha etc.)
#

http_archive(
    name = "org_pubref_rules_node",
    sha256 = "019cb4d3d96c90ac7fd92ebc7e1a86bb73e002a8c8b033d22704b179ac4250dc",
    strip_prefix = "rules_node-0.4.1",
    url = "https://github.com/pubref/rules_node/archive/v0.4.1.tar.gz",
)

load("@org_pubref_rules_node//node:rules.bzl", "node_repositories", "yarn_modules")

node_repositories()

# Use a package.json file as input. Location of the package json
# is arbitrary.
yarn_modules(
    name = "yarn_modules",
    package_json = "//:package.json",
)

# A separate mocha installation used by mocha_test.
yarn_modules(
    name = "mocha_modules",
    deps = {
        "mocha": "^4.0.1",
    },
)
