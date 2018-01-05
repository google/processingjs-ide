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
    sha256 = "25f5399f18d8bf9ce435f85c6bbf671ec4820bc4396b3022cc5dc4bc66303609",
    strip_prefix = "rules_closure-0.4.2",
    url = "https://mirror.bazel.build/github.com/bazelbuild/rules_closure/archive/0.4.2.tar.gz",
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
    sha256 = "90bb270d0a92ed5c83558b2797346917c46547f6f7103e648941ecdb6b9d0e72",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.8.1/rules_go-0.8.1.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()
