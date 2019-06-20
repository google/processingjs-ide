resolved = [
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/crosstool",
            "actual": "@bazel_tools//tools/cpp:toolchain"
        },
        "native": "bind(name = \"android/crosstool\", actual = \"@bazel_tools//tools/cpp:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/dx_jar_import",
            "actual": "@bazel_tools//tools/android:no_android_sdk_repository_error"
        },
        "native": "bind(name = \"android/dx_jar_import\", actual = \"@bazel_tools//tools/android:no_android_sdk_repository_error\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/sdk",
            "actual": "@bazel_tools//tools/android:poison_pill_android_sdk"
        },
        "native": "bind(name = \"android/sdk\", actual = \"@bazel_tools//tools/android:poison_pill_android_sdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_ndk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_ndk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_sdk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_sdk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "bazel_tools",
            "path": "/usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/install/39bc573845b7004b30b12e1a70ed57b7/_embedded_binaries/embedded_tools"
        },
        "native": "local_repository(name = \"bazel_tools\", path = __embedded_dir__ + \"/\" + \"embedded_tools\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "cc_toolchain",
            "actual": "@local_config_cc//:toolchain"
        },
        "native": "bind(name = \"cc_toolchain\", actual = \"@local_config_cc//:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "databinding_annotation_processor",
            "actual": "@bazel_tools//tools/android:empty"
        },
        "native": "bind(name = \"databinding_annotation_processor\", actual = \"@bazel_tools//tools/android:empty\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "has_androidsdk",
            "actual": "@bazel_tools//tools/android:always_false"
        },
        "native": "bind(name = \"has_androidsdk\", actual = \"@bazel_tools//tools/android:always_false\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:20:1",
        "original_attributes": {
            "name": "com_google_protobuf",
            "remote": "https://github.com/google/protobuf.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "8cc680deee190e7d747d5bcc752eeb972d5dca6c9d898c49436554020554a211",
                "attributes": {
                    "remote": "https://github.com/google/protobuf.git",
                    "commit": "7f84a943667358a53bd5d255ee9769ca83e75cd9",
                    "shallow_since": "1560903175 -0700",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "com_google_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_closure' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:30:1",
        "original_attributes": {
            "name": "io_bazel_rules_closure",
            "remote": "https://github.com/bazelbuild/rules_closure.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "5612574a8eb7b49b7a8656dc466b7a72df89bc80886ac98a08188bf7b9adc0c4",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/rules_closure.git",
                    "commit": "03110588392d8c6c05b99c08a6f1c2121604ca27",
                    "shallow_since": "1560950949 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "io_bazel_rules_closure"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'aopalliance' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:180:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:77:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "aopalliance",
            "licenses": [
                "unencumbered"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar",
                "https://repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar",
                "http://maven.ibiblio.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar"
            ],
            "jar_sha256": "0addec670fedcd3f113c5c8091d783280d23f75e3acb841b61a9cdb079376a08"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "89e67506230e35a9c763e65e431d7a7525114a6719f892285c694e6e4cf18b2c",
                "attributes": {
                    "name": "aopalliance",
                    "licenses": [
                        "unencumbered"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar",
                        "https://repo1.maven.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar",
                        "http://maven.ibiblio.org/maven2/aopalliance/aopalliance/1.0/aopalliance-1.0.jar"
                    ],
                    "jar_sha256": "0addec670fedcd3f113c5c8091d783280d23f75e3acb841b61a9cdb079376a08"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'args4j' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:192:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:79:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "args4j",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/args4j/args4j/2.0.26/args4j-2.0.26.jar",
                "https://repo1.maven.org/maven2/args4j/args4j/2.0.26/args4j-2.0.26.jar"
            ],
            "jar_sha256": "989bda2321ea073a03686e9d4437ea4928c72c99f993f9ca6fab24615f0771a4"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "cdece370da21a16312976984a4feb346062733f19069959f42563f7fcb9513c0",
                "attributes": {
                    "name": "args4j",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/args4j/args4j/2.0.26/args4j-2.0.26.jar",
                        "https://repo1.maven.org/maven2/args4j/args4j/2.0.26/args4j-2.0.26.jar"
                    ],
                    "jar_sha256": "989bda2321ea073a03686e9d4437ea4928c72c99f993f9ca6fab24615f0771a4"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'bazel_skylib' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:203:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:81:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "bazel_skylib",
            "urls": [
                "https://github.com/bazelbuild/bazel-skylib/releases/download/0.8.0/bazel-skylib.0.8.0.tar.gz"
            ],
            "sha256": "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "b595c6c66f3d3a16393e1cc004fadac5d7f3c279e411c57c1a1d0cf5189cb861",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/bazel-skylib/releases/download/0.8.0/bazel-skylib.0.8.0.tar.gz"
                    ],
                    "sha256": "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "bazel_skylib"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:platform_http_file.bzl%platform_http_file",
        "definition_information": "Call stack for the definition of repository 'clang' which is a platform_http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/platform_http_file.bzl:37:22):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:210:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:83:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "clang",
            "amd64_urls": [
                "https://mirror.bazel.build/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz",
                "http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz"
            ],
            "amd64_sha256": "3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7",
            "macos_urls": [
                "https://mirror.bazel.build/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz",
                "http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz"
            ],
            "macos_sha256": "e5a961e04b0e1738bbb5b824886a34932dc13b0af699d1fe16519d814d7b776f"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:platform_http_file.bzl%platform_http_file",
                "output_tree_hash": "e1224b56a3780b12a11770baee5b325d2c8bb6b53beb13fb42d297e04b5f588e",
                "attributes": {
                    "name": "clang",
                    "amd64_urls": [
                        "https://mirror.bazel.build/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz",
                        "http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz"
                    ],
                    "amd64_sha256": "3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7",
                    "macos_urls": [
                        "https://mirror.bazel.build/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz",
                        "http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz"
                    ],
                    "macos_sha256": "e5a961e04b0e1738bbb5b824886a34932dc13b0af699d1fe16519d814d7b776f"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'closure_compiler' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:63:1",
        "original_attributes": {
            "name": "closure_compiler",
            "url": "https://github.com/google/closure-compiler/archive/v20190121.tar.gz",
            "sha256": "418f1120146bd349b246388ce0d0255acd3f7e96519682237bad0909b32f931d",
            "strip_prefix": "closure-compiler-20190121",
            "build_file": "//:third_party/closure-compiler.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "538a2b17c3601658ed17ce6f1ad74f5e83460f0f416be11cedb729d3c548dd7f",
                "attributes": {
                    "url": "https://github.com/google/closure-compiler/archive/v20190121.tar.gz",
                    "urls": [],
                    "sha256": "418f1120146bd349b246388ce0d0255acd3f7e96519682237bad0909b32f931d",
                    "canonical_id": "",
                    "strip_prefix": "closure-compiler-20190121",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "//:third_party/closure-compiler.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "closure_compiler"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_common' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:225:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:85:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_auto_common",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar",
                "https://repo1.maven.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar",
                "http://maven.ibiblio.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar"
            ],
            "jar_sha256": "eee75e0d1b1b8f31584dcbe25e7c30752545001b46673d007d468d75cf6b2c52",
            "deps": [
                "@com_google_guava"
            ],
            "default_visibility": [
                "@com_google_auto_factory//:__pkg__"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "40159515febcacd6e7d116b436286fdc36ccf2a5f19e5114688358dcb7a2ec6c",
                "attributes": {
                    "name": "com_google_auto_common",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar",
                        "https://repo1.maven.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar",
                        "http://maven.ibiblio.org/maven2/com/google/auto/auto-common/0.7/auto-common-0.7.jar"
                    ],
                    "jar_sha256": "eee75e0d1b1b8f31584dcbe25e7c30752545001b46673d007d468d75cf6b2c52",
                    "deps": [
                        "@com_google_guava"
                    ],
                    "default_visibility": [
                        "@com_google_auto_factory//:__pkg__"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_factory' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:239:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:87:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_auto_factory",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/factory/auto-factory/1.0-beta5/auto-factory-1.0-beta5.jar",
                "https://repo1.maven.org/maven2/com/google/auto/factory/auto-factory/1.0-beta5/auto-factory-1.0-beta5.jar"
            ],
            "jar_sha256": "e6bed6aaa879f568449d735561a6a26a5a06f7662ed96ca88d27d2200a8dc6cf",
            "generated_rule_name": "jar",
            "extra_build_file_content": "java_library(\n    name = \"processor\",\n    exports = [\":jar\"],\n    runtime_deps = [\n        \"@com_google_auto_common\",\n        \"@com_google_auto_value\",\n        \"@com_google_guava\",\n        \"@com_google_java_format\",\n        \"@com_squareup_javapoet\",\n        \"@javax_inject\",\n    ],\n)\n\njava_plugin(\n    name = \"AutoFactoryProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.factory.processor.AutoFactoryProcessor\",\n    generates_api = 1,\n    tags = [\"annotation=com.google.auto.factory.AutoFactory;genclass=${package}.${outerclasses}@{className|${classname}Factory}\"],\n    deps = [\":processor\"],\n)\n\njava_library(\n    name = \"com_google_auto_factory\",\n    exported_plugins = [\":AutoFactoryProcessor\"],\n    exports = [\n        \":jar\",\n        \"@com_google_code_findbugs_jsr305\",\n        \"@javax_annotation_jsr250_api\",\n        \"@javax_inject\",\n    ],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "08025780e2296f9b0e88f745ae34649d5b95a4f5997f0edc8113ac147d7af87a",
                "attributes": {
                    "name": "com_google_auto_factory",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/factory/auto-factory/1.0-beta5/auto-factory-1.0-beta5.jar",
                        "https://repo1.maven.org/maven2/com/google/auto/factory/auto-factory/1.0-beta5/auto-factory-1.0-beta5.jar"
                    ],
                    "jar_sha256": "e6bed6aaa879f568449d735561a6a26a5a06f7662ed96ca88d27d2200a8dc6cf",
                    "generated_rule_name": "jar",
                    "extra_build_file_content": "java_library(\n    name = \"processor\",\n    exports = [\":jar\"],\n    runtime_deps = [\n        \"@com_google_auto_common\",\n        \"@com_google_auto_value\",\n        \"@com_google_guava\",\n        \"@com_google_java_format\",\n        \"@com_squareup_javapoet\",\n        \"@javax_inject\",\n    ],\n)\n\njava_plugin(\n    name = \"AutoFactoryProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.factory.processor.AutoFactoryProcessor\",\n    generates_api = 1,\n    tags = [\"annotation=com.google.auto.factory.AutoFactory;genclass=${package}.${outerclasses}@{className|${classname}Factory}\"],\n    deps = [\":processor\"],\n)\n\njava_library(\n    name = \"com_google_auto_factory\",\n    exported_plugins = [\":AutoFactoryProcessor\"],\n    exports = [\n        \":jar\",\n        \"@com_google_code_findbugs_jsr305\",\n        \"@javax_annotation_jsr250_api\",\n        \"@javax_inject\",\n    ],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:292:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:89:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_auto_value",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/value/auto-value/1.6/auto-value-1.6.jar",
                "https://repo1.maven.org/maven2/com/google/auto/value/auto-value/1.6/auto-value-1.6.jar"
            ],
            "jar_sha256": "fd811b92bb59ae8a4cf7eb9dedd208300f4ea2b6275d726e4df52d8334aaae9d",
            "exports": [
                "@com_google_auto_value_annotations"
            ],
            "generated_rule_name": "processor",
            "extra_build_file_content": "java_plugin(\n    name = \"AutoAnnotationProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoAnnotationProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoAnnotation;genclass=${package}.AutoAnnotation_${outerclasses}${classname}_${methodname}\"],\n    deps = [\":processor\"],\n)\n\njava_plugin(\n    name = \"AutoOneOfProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoOneOfProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoValue;genclass=${package}.AutoOneOf_${outerclasses}${classname}\"],\n    deps = [\":processor\"],\n)\n\njava_plugin(\n    name = \"AutoValueProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoValueProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoValue;genclass=${package}.AutoValue_${outerclasses}${classname}\"],\n    deps = [\":processor\"],\n)\n\njava_library(\n    name = \"com_google_auto_value\",\n    exported_plugins = [\n        \":AutoAnnotationProcessor\",\n        \":AutoOneOfProcessor\",\n        \":AutoValueProcessor\",\n    ],\n    exports = [\"@com_google_auto_value_annotations\"],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "5e50ef51b41ae627761bc353192e366f2dc0b44450f96d156b820a119f3fb992",
                "attributes": {
                    "name": "com_google_auto_value",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/value/auto-value/1.6/auto-value-1.6.jar",
                        "https://repo1.maven.org/maven2/com/google/auto/value/auto-value/1.6/auto-value-1.6.jar"
                    ],
                    "jar_sha256": "fd811b92bb59ae8a4cf7eb9dedd208300f4ea2b6275d726e4df52d8334aaae9d",
                    "exports": [
                        "@com_google_auto_value_annotations"
                    ],
                    "generated_rule_name": "processor",
                    "extra_build_file_content": "java_plugin(\n    name = \"AutoAnnotationProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoAnnotationProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoAnnotation;genclass=${package}.AutoAnnotation_${outerclasses}${classname}_${methodname}\"],\n    deps = [\":processor\"],\n)\n\njava_plugin(\n    name = \"AutoOneOfProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoOneOfProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoValue;genclass=${package}.AutoOneOf_${outerclasses}${classname}\"],\n    deps = [\":processor\"],\n)\n\njava_plugin(\n    name = \"AutoValueProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"com.google.auto.value.processor.AutoValueProcessor\",\n    tags = [\"annotation=com.google.auto.value.AutoValue;genclass=${package}.AutoValue_${outerclasses}${classname}\"],\n    deps = [\":processor\"],\n)\n\njava_library(\n    name = \"com_google_auto_value\",\n    exported_plugins = [\n        \":AutoAnnotationProcessor\",\n        \":AutoOneOfProcessor\",\n        \":AutoValueProcessor\",\n    ],\n    exports = [\"@com_google_auto_value_annotations\"],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value_annotations' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:341:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:91:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_auto_value_annotations",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/value/auto-value-annotations/1.6/auto-value-annotations-1.6.jar",
                "https://repo1.maven.org/maven2/com/google/auto/value/auto-value-annotations/1.6/auto-value-annotations-1.6.jar"
            ],
            "jar_sha256": "d095936c432f2afc671beaab67433e7cef50bba4a861b77b9c46561b801fae69",
            "neverlink": True,
            "default_visibility": [
                "@com_google_auto_value//:__pkg__"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "ed1994817067d93a4cac2589f8f52a23c3f1c0252d38b33bfb0bcba61281431f",
                "attributes": {
                    "name": "com_google_auto_value_annotations",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/auto/value/auto-value-annotations/1.6/auto-value-annotations-1.6.jar",
                        "https://repo1.maven.org/maven2/com/google/auto/value/auto-value-annotations/1.6/auto-value-annotations-1.6.jar"
                    ],
                    "jar_sha256": "d095936c432f2afc671beaab67433e7cef50bba4a861b77b9c46561b801fae69",
                    "neverlink": True,
                    "default_visibility": [
                        "@com_google_auto_value//:__pkg__"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_closure_stylesheets' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:354:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:93:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_closure_stylesheets",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/closure-stylesheets/closure-stylesheets/1.5.0/closure-stylesheets-1.5.0.jar",
                "https://repo1.maven.org/maven2/com/google/closure-stylesheets/closure-stylesheets/1.5.0/closure-stylesheets-1.5.0.jar"
            ],
            "jar_sha256": "fef768d4f7cead3c0c0783891118e7d3d6ecf17a3093557891f583d842362e2b",
            "deps": [
                "@args4j",
                "@com_google_javascript_closure_compiler",
                "@com_google_code_gson",
                "@com_google_guava",
                "@com_google_code_findbugs_jsr305"
            ],
            "extra_build_file_content": "java_binary(\n    name = \"ClosureCommandLineCompiler\",\n    main_class = \"com.google.common.css.compiler.commandline.ClosureCommandLineCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_closure_stylesheets\"],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "b7f6fcc57bd121fcbaf54cca54a2c7720d55d6fc9ce843de2d946b9fa1705435",
                "attributes": {
                    "name": "com_google_closure_stylesheets",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/closure-stylesheets/closure-stylesheets/1.5.0/closure-stylesheets-1.5.0.jar",
                        "https://repo1.maven.org/maven2/com/google/closure-stylesheets/closure-stylesheets/1.5.0/closure-stylesheets-1.5.0.jar"
                    ],
                    "jar_sha256": "fef768d4f7cead3c0c0783891118e7d3d6ecf17a3093557891f583d842362e2b",
                    "deps": [
                        "@args4j",
                        "@com_google_javascript_closure_compiler",
                        "@com_google_code_gson",
                        "@com_google_guava",
                        "@com_google_code_findbugs_jsr305"
                    ],
                    "extra_build_file_content": "java_binary(\n    name = \"ClosureCommandLineCompiler\",\n    main_class = \"com.google.common.css.compiler.commandline.ClosureCommandLineCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_closure_stylesheets\"],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_code_findbugs_jsr305' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:380:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:95:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_code_findbugs_jsr305",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar",
                "https://repo1.maven.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar",
                "http://maven.ibiblio.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar"
            ],
            "jar_sha256": "bec0b24dcb23f9670172724826584802b80ae6cbdaba03bdebdef9327b962f6a"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "fb714cd087e8079ba21dc6e527c256743b8b769766d452f2bba3f9a465a95e95",
                "attributes": {
                    "name": "com_google_code_findbugs_jsr305",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar",
                        "https://repo1.maven.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar",
                        "http://maven.ibiblio.org/maven2/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar"
                    ],
                    "jar_sha256": "bec0b24dcb23f9670172724826584802b80ae6cbdaba03bdebdef9327b962f6a"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_code_gson' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:392:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:97:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_code_gson",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar",
                "https://repo1.maven.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar",
                "http://maven.ibiblio.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar"
            ],
            "jar_sha256": "2d43eb5ea9e133d2ee2405cc14f5ee08951b8361302fdd93494a3a997b508d32",
            "deps": [
                "@com_google_code_findbugs_jsr305"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "387beff1b970eaf1cfd4d2bbfcc02cb964cbdfb3ca2fb79c6530e1f8589396ef",
                "attributes": {
                    "name": "com_google_code_gson",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar",
                        "https://repo1.maven.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar",
                        "http://maven.ibiblio.org/maven2/com/google/code/gson/gson/2.7/gson-2.7.jar"
                    ],
                    "jar_sha256": "2d43eb5ea9e133d2ee2405cc14f5ee08951b8361302fdd93494a3a997b508d32",
                    "deps": [
                        "@com_google_code_findbugs_jsr305"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_common_html_types' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:405:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:99:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_common_html_types",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/common/html/types/types/1.0.7/types-1.0.7.jar",
                "https://repo1.maven.org/maven2/com/google/common/html/types/types/1.0.7/types-1.0.7.jar"
            ],
            "jar_sha256": "78b6baa2ecc56435dc0ae88c57f442bd2d07127cb50424d400441ddccc45ea24",
            "deps": [
                "@com_google_code_findbugs_jsr305",
                "@com_google_errorprone_error_prone_annotations",
                "@com_google_guava",
                "@com_google_jsinterop_annotations",
                "@com_google_protobuf//:protobuf_java",
                "@javax_annotation_jsr250_api"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "73ea20da02b2d55a262df2cb957d4af39e72e35271019b465fd5bbde3a4a5977",
                "attributes": {
                    "name": "com_google_common_html_types",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/common/html/types/types/1.0.7/types-1.0.7.jar",
                        "https://repo1.maven.org/maven2/com/google/common/html/types/types/1.0.7/types-1.0.7.jar"
                    ],
                    "jar_sha256": "78b6baa2ecc56435dc0ae88c57f442bd2d07127cb50424d400441ddccc45ea24",
                    "deps": [
                        "@com_google_code_findbugs_jsr305",
                        "@com_google_errorprone_error_prone_annotations",
                        "@com_google_guava",
                        "@com_google_jsinterop_annotations",
                        "@com_google_protobuf//:protobuf_java",
                        "@javax_annotation_jsr250_api"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_common_html_types_html_proto' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:424:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:101:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_common_html_types_html_proto",
            "sha256": "6ece202f11574e37d0c31d9cf2e9e11a0dbc9218766d50d211059ebd495b49c3",
            "urls": [
                "https://mirror.bazel.build/raw.githubusercontent.com/google/safe-html-types/release-1.0.5/proto/src/main/protobuf/webutil/html/types/proto/html.proto",
                "https://raw.githubusercontent.com/google/safe-html-types/release-1.0.5/proto/src/main/protobuf/webutil/html/types/proto/html.proto"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "b2286b9e3179c49df2e51cb7d8fc8bac7f038567b1d56b32d7f832f2e170a5b8",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "6ece202f11574e37d0c31d9cf2e9e11a0dbc9218766d50d211059ebd495b49c3",
                    "urls": [
                        "https://mirror.bazel.build/raw.githubusercontent.com/google/safe-html-types/release-1.0.5/proto/src/main/protobuf/webutil/html/types/proto/html.proto",
                        "https://raw.githubusercontent.com/google/safe-html-types/release-1.0.5/proto/src/main/protobuf/webutil/html/types/proto/html.proto"
                    ],
                    "name": "com_google_common_html_types_html_proto"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_dagger' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:434:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:103:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_dagger",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger/2.14.1/dagger-2.14.1.jar",
                "https://repo1.maven.org/maven2/com/google/dagger/dagger/2.14.1/dagger-2.14.1.jar"
            ],
            "jar_sha256": "374cfee26c9c93f44caa1946583c9edc135bb9a42838476522551ec46aa55c7c",
            "deps": [
                "@javax_inject"
            ],
            "generated_rule_name": "runtime",
            "extra_build_file_content": "java_library(\n    name = \"com_google_dagger\",\n    exported_plugins = [\"@com_google_dagger_compiler//:ComponentProcessor\"],\n    exports = [\n        \":runtime\",\n        \"@javax_inject\",\n    ],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "095f99d76af05ce8e4c6161e5605d119ef893a1ca4cd839d31e6832e85e394bb",
                "attributes": {
                    "name": "com_google_dagger",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger/2.14.1/dagger-2.14.1.jar",
                        "https://repo1.maven.org/maven2/com/google/dagger/dagger/2.14.1/dagger-2.14.1.jar"
                    ],
                    "jar_sha256": "374cfee26c9c93f44caa1946583c9edc135bb9a42838476522551ec46aa55c7c",
                    "deps": [
                        "@javax_inject"
                    ],
                    "generated_rule_name": "runtime",
                    "extra_build_file_content": "java_library(\n    name = \"com_google_dagger\",\n    exported_plugins = [\"@com_google_dagger_compiler//:ComponentProcessor\"],\n    exports = [\n        \":runtime\",\n        \"@javax_inject\",\n    ],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_dagger_compiler' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:457:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:105:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_dagger_compiler",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-compiler/2.14.1/dagger-compiler-2.14.1.jar",
                "https://repo1.maven.org/maven2/com/google/dagger/dagger-compiler/2.14.1/dagger-compiler-2.14.1.jar"
            ],
            "jar_sha256": "ff16d55273e375349537fc82292b00de04d8a2caca2d4aa6c642692b1a68194d",
            "deps": [
                "@com_google_code_findbugs_jsr305",
                "@com_google_dagger//:runtime",
                "@com_google_dagger_producers//:runtime",
                "@com_google_dagger_spi",
                "@com_google_guava",
                "@com_google_java_format",
                "@com_squareup_javapoet"
            ],
            "extra_build_file_content": "java_plugin(\n    name = \"ComponentProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"dagger.internal.codegen.ComponentProcessor\",\n    generates_api = 1,\n    tags = [\n        \"annotation=dagger.Component;genclass=${package}.Dagger${outerclasses}${classname}\",\n        \"annotation=dagger.producers.ProductionComponent;genclass=${package}.Dagger${outerclasses}${classname}\",\n    ],\n    deps = [\":com_google_dagger_compiler\"],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "2be5f03ea1d5ac9b53edf2f9aa83fbda791a8b6b3e425512da48d6ff23992e28",
                "attributes": {
                    "name": "com_google_dagger_compiler",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-compiler/2.14.1/dagger-compiler-2.14.1.jar",
                        "https://repo1.maven.org/maven2/com/google/dagger/dagger-compiler/2.14.1/dagger-compiler-2.14.1.jar"
                    ],
                    "jar_sha256": "ff16d55273e375349537fc82292b00de04d8a2caca2d4aa6c642692b1a68194d",
                    "deps": [
                        "@com_google_code_findbugs_jsr305",
                        "@com_google_dagger//:runtime",
                        "@com_google_dagger_producers//:runtime",
                        "@com_google_dagger_spi",
                        "@com_google_guava",
                        "@com_google_java_format",
                        "@com_squareup_javapoet"
                    ],
                    "extra_build_file_content": "java_plugin(\n    name = \"ComponentProcessor\",\n    output_licenses = [\"unencumbered\"],\n    processor_class = \"dagger.internal.codegen.ComponentProcessor\",\n    generates_api = 1,\n    tags = [\n        \"annotation=dagger.Component;genclass=${package}.Dagger${outerclasses}${classname}\",\n        \"annotation=dagger.producers.ProductionComponent;genclass=${package}.Dagger${outerclasses}${classname}\",\n    ],\n    deps = [\":com_google_dagger_compiler\"],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_dagger_producers' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:490:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:107:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_dagger_producers",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-producers/2.14.1/dagger-producers-2.14.1.jar",
                "https://repo1.maven.org/maven2/com/google/dagger/dagger-producers/2.14.1/dagger-producers-2.14.1.jar"
            ],
            "jar_sha256": "96f950bc4b94d013b0c538632a4bc630f33eda8b01f63ae752b76c5e48783859",
            "deps": [
                "@com_google_dagger//:runtime",
                "@com_google_guava"
            ],
            "generated_rule_name": "runtime",
            "extra_build_file_content": "java_library(\n    name = \"com_google_dagger_producers\",\n    exported_plugins = [\"@com_google_dagger_compiler//:ComponentProcessor\"],\n    exports = [\n        \":runtime\",\n        \"@com_google_dagger//:runtime\",\n        \"@javax_inject\",\n    ],\n)"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "307e79c5af1ca7b6a033c583df1a7ca855d8d0063ace1b6de7441cbba8a335bc",
                "attributes": {
                    "name": "com_google_dagger_producers",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-producers/2.14.1/dagger-producers-2.14.1.jar",
                        "https://repo1.maven.org/maven2/com/google/dagger/dagger-producers/2.14.1/dagger-producers-2.14.1.jar"
                    ],
                    "jar_sha256": "96f950bc4b94d013b0c538632a4bc630f33eda8b01f63ae752b76c5e48783859",
                    "deps": [
                        "@com_google_dagger//:runtime",
                        "@com_google_guava"
                    ],
                    "generated_rule_name": "runtime",
                    "extra_build_file_content": "java_library(\n    name = \"com_google_dagger_producers\",\n    exported_plugins = [\"@com_google_dagger_compiler//:ComponentProcessor\"],\n    exports = [\n        \":runtime\",\n        \"@com_google_dagger//:runtime\",\n        \"@javax_inject\",\n    ],\n)"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_dagger_spi' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:517:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:109:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_dagger_spi",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-spi/2.14.1/dagger-spi-2.14.1.jar",
                "https://repo1.maven.org/maven2/com/google/dagger/dagger-spi/2.14.1/dagger-spi-2.14.1.jar"
            ],
            "jar_sha256": "6a20d6c6620fefe50747e9e910e0d0c178cf39d76b67ccffb505ac9a167302cb"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "090261867cc743893767dfa222ef0dcb0fde4f32d727462207245a8b8697a698",
                "attributes": {
                    "name": "com_google_dagger_spi",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/dagger/dagger-spi/2.14.1/dagger-spi-2.14.1.jar",
                        "https://repo1.maven.org/maven2/com/google/dagger/dagger-spi/2.14.1/dagger-spi-2.14.1.jar"
                    ],
                    "jar_sha256": "6a20d6c6620fefe50747e9e910e0d0c178cf39d76b67ccffb505ac9a167302cb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_error_prone_annotations' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:528:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:111:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_errorprone_error_prone_annotations",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar",
                "https://repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar"
            ],
            "jar_sha256": "03d0329547c13da9e17c634d1049ea2ead093925e290567e1a364fd6b1fc7ff8"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "f2f1c10e477e7d00ca3cc13685d8c810ab83a775e2c0e4ab2335bf8330bd8764",
                "attributes": {
                    "name": "com_google_errorprone_error_prone_annotations",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar",
                        "https://repo1.maven.org/maven2/com/google/errorprone/error_prone_annotations/2.1.3/error_prone_annotations-2.1.3.jar"
                    ],
                    "jar_sha256": "03d0329547c13da9e17c634d1049ea2ead093925e290567e1a364fd6b1fc7ff8"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_javac_shaded' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:541:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:113:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_errorprone_javac_shaded",
            "licenses": [
                "restricted"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/errorprone/javac-shaded/9-dev-r4023-3/javac-shaded-9-dev-r4023-3.jar",
                "https://repo1.maven.org/maven2/com/google/errorprone/javac-shaded/9-dev-r4023-3/javac-shaded-9-dev-r4023-3.jar"
            ],
            "jar_sha256": "65bfccf60986c47fbc17c9ebab0be626afc41741e0a6ec7109e0768817a36f30"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "d88c5c781715e1db62653b531e1b7ccae52e249378294e0a81f87be2dcf36ec8",
                "attributes": {
                    "name": "com_google_errorprone_javac_shaded",
                    "licenses": [
                        "restricted"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/errorprone/javac-shaded/9-dev-r4023-3/javac-shaded-9-dev-r4023-3.jar",
                        "https://repo1.maven.org/maven2/com/google/errorprone/javac-shaded/9-dev-r4023-3/javac-shaded-9-dev-r4023-3.jar"
                    ],
                    "jar_sha256": "65bfccf60986c47fbc17c9ebab0be626afc41741e0a6ec7109e0768817a36f30"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_guava' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:557:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:115:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_guava",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar",
                "https://repo1.maven.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar"
            ],
            "jar_sha256": "6db0c3a244c397429c2e362ea2837c3622d5b68bb95105d37c21c36e5bc70abf",
            "exports": [
                "@com_google_code_findbugs_jsr305",
                "@com_google_errorprone_error_prone_annotations"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "7525394514d0e64e206a8d8fabb6ef20c9c43b8b464863c7a5a6f09d998cb2c7",
                "attributes": {
                    "name": "com_google_guava",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar",
                        "https://repo1.maven.org/maven2/com/google/guava/guava/25.1-jre/guava-25.1-jre.jar"
                    ],
                    "jar_sha256": "6db0c3a244c397429c2e362ea2837c3622d5b68bb95105d37c21c36e5bc70abf",
                    "exports": [
                        "@com_google_code_findbugs_jsr305",
                        "@com_google_errorprone_error_prone_annotations"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_inject_extensions_guice_assistedinject' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:572:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:117:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_inject_extensions_guice_assistedinject",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar",
                "https://repo1.maven.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar",
                "http://maven.ibiblio.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar"
            ],
            "jar_sha256": "663728123fb9a6b79ea39ae289e5d56b4113e1b8e9413eb792f91e53a6dd5868",
            "deps": [
                "@com_google_guava",
                "@com_google_inject_guice",
                "@javax_inject"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "6d2d93a8946af78ae427c2d39fe9034dc9d734a9def81ff25d76626d09b4fc63",
                "attributes": {
                    "name": "com_google_inject_extensions_guice_assistedinject",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar",
                        "https://repo1.maven.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar",
                        "http://maven.ibiblio.org/maven2/com/google/inject/extensions/guice-assistedinject/4.1.0/guice-assistedinject-4.1.0.jar"
                    ],
                    "jar_sha256": "663728123fb9a6b79ea39ae289e5d56b4113e1b8e9413eb792f91e53a6dd5868",
                    "deps": [
                        "@com_google_guava",
                        "@com_google_inject_guice",
                        "@javax_inject"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_inject_extensions_guice_multibindings' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:589:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:119:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_inject_extensions_guice_multibindings",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar",
                "https://repo1.maven.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar",
                "http://maven.ibiblio.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar"
            ],
            "jar_sha256": "592773a4c745cc87ba37fa0647fed8126c7e474349c603c9f229aa25d3ef5448",
            "deps": [
                "@com_google_guava",
                "@com_google_inject_guice",
                "@javax_inject"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "ee054c5851d383e8ec35b9683384871389d55ddd423c537d01e4a1a177b6d16b",
                "attributes": {
                    "name": "com_google_inject_extensions_guice_multibindings",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar",
                        "https://repo1.maven.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar",
                        "http://maven.ibiblio.org/maven2/com/google/inject/extensions/guice-multibindings/4.1.0/guice-multibindings-4.1.0.jar"
                    ],
                    "jar_sha256": "592773a4c745cc87ba37fa0647fed8126c7e474349c603c9f229aa25d3ef5448",
                    "deps": [
                        "@com_google_guava",
                        "@com_google_inject_guice",
                        "@javax_inject"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_inject_guice' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:606:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:121:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_inject_guice",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar",
                "https://repo1.maven.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar",
                "http://maven.ibiblio.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar"
            ],
            "jar_sha256": "9b9df27a5b8c7864112b4137fd92b36c3f1395bfe57be42fedf2f520ead1a93e",
            "deps": [
                "@aopalliance",
                "@org_ow2_asm",
                "@com_google_guava",
                "@com_google_code_findbugs_jsr305",
                "@javax_inject"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "85e5dbae8fc24b01bec3fbdf26b556efd1e5e68e5516b2d5843a5098a8135e49",
                "attributes": {
                    "name": "com_google_inject_guice",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar",
                        "https://repo1.maven.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar",
                        "http://maven.ibiblio.org/maven2/com/google/inject/guice/4.1.0/guice-4.1.0.jar"
                    ],
                    "jar_sha256": "9b9df27a5b8c7864112b4137fd92b36c3f1395bfe57be42fedf2f520ead1a93e",
                    "deps": [
                        "@aopalliance",
                        "@org_ow2_asm",
                        "@com_google_guava",
                        "@com_google_code_findbugs_jsr305",
                        "@javax_inject"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_java_format' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:625:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:123:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_java_format",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/googlejavaformat/google-java-format/1.5/google-java-format-1.5.jar",
                "https://repo1.maven.org/maven2/com/google/googlejavaformat/google-java-format/1.5/google-java-format-1.5.jar"
            ],
            "jar_sha256": "aa19ad7850fb85178aa22f2fddb163b84d6ce4d0035872f30d4408195ca1144e",
            "deps": [
                "@com_google_guava",
                "@com_google_errorprone_javac_shaded"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "6cd0419f8faeac53e233eb802c8ad5f0c8f86196450bbb5594312eba75d6a9f2",
                "attributes": {
                    "name": "com_google_java_format",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/googlejavaformat/google-java-format/1.5/google-java-format-1.5.jar",
                        "https://repo1.maven.org/maven2/com/google/googlejavaformat/google-java-format/1.5/google-java-format-1.5.jar"
                    ],
                    "jar_sha256": "aa19ad7850fb85178aa22f2fddb163b84d6ce4d0035872f30d4408195ca1144e",
                    "deps": [
                        "@com_google_guava",
                        "@com_google_errorprone_javac_shaded"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_javascript_closure_compiler' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:642:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:125:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_javascript_closure_compiler",
            "licenses": [
                "reciprocal"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/javascript/closure-compiler-unshaded/v20190528/closure-compiler-unshaded-v20190528.jar",
                "http://repo1.maven.org/maven2/com/google/javascript/closure-compiler-unshaded/v20190528/closure-compiler-unshaded-v20190528.jar"
            ],
            "jar_sha256": "5e8262a9208e3acf22cf1109928355e6d6c0b4bfe44fbf42e3ef537084353fe5",
            "deps": [
                "@com_google_code_gson",
                "@com_google_guava",
                "@com_google_code_findbugs_jsr305",
                "@com_google_protobuf//:protobuf_java"
            ],
            "extra_build_file_content": "java_binary(\n    name = \"main\",\n    main_class = \"com.google.javascript.jscomp.CommandLineRunner\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\n        \":com_google_javascript_closure_compiler\",\n        \"@args4j\",\n    ],\n)\n\ngenrule(\n    name = \"externs\",\n    srcs = [\"closure-compiler-unshaded-v20190528.jar\"],\n    outs = [\"externs.zip\"],\n    tools = [\"@bazel_tools//tools/jdk:jar\"],\n    cmd = \"$(location @bazel_tools//tools/jdk:jar) -xf $(location :closure-compiler-unshaded-v20190528.jar) externs.zip; mv externs.zip $@\",\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "9a62b7991d2cfb5970821815ac8d6d4916d6d52439878f2d97e0362b7f7f7269",
                "attributes": {
                    "name": "com_google_javascript_closure_compiler",
                    "licenses": [
                        "reciprocal"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/javascript/closure-compiler-unshaded/v20190528/closure-compiler-unshaded-v20190528.jar",
                        "http://repo1.maven.org/maven2/com/google/javascript/closure-compiler-unshaded/v20190528/closure-compiler-unshaded-v20190528.jar"
                    ],
                    "jar_sha256": "5e8262a9208e3acf22cf1109928355e6d6c0b4bfe44fbf42e3ef537084353fe5",
                    "deps": [
                        "@com_google_code_gson",
                        "@com_google_guava",
                        "@com_google_code_findbugs_jsr305",
                        "@com_google_protobuf//:protobuf_java"
                    ],
                    "extra_build_file_content": "java_binary(\n    name = \"main\",\n    main_class = \"com.google.javascript.jscomp.CommandLineRunner\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\n        \":com_google_javascript_closure_compiler\",\n        \"@args4j\",\n    ],\n)\n\ngenrule(\n    name = \"externs\",\n    srcs = [\"closure-compiler-unshaded-v20190528.jar\"],\n    outs = [\"externs.zip\"],\n    tools = [\"@bazel_tools//tools/jdk:jar\"],\n    cmd = \"$(location @bazel_tools//tools/jdk:jar) -xf $(location :closure-compiler-unshaded-v20190528.jar) externs.zip; mv externs.zip $@\",\n)\n"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_javascript_closure_library' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:680:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:127:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_javascript_closure_library",
            "urls": [
                "https://mirror.bazel.build/github.com/google/closure-library/archive/v20190415.tar.gz",
                "https://github.com/google/closure-library/archive/v20190415.tar.gz"
            ],
            "sha256": "b92f9c2b81adeb06b16e0a5d748baf115eeb58884fe864bec3fe8e23a7cf7d14",
            "strip_prefix": "closure-library-20190415",
            "build_file": "@io_bazel_rules_closure//closure/library:closure_library.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "53eca0f071c91c2ebc9dfd4d9bee30e2ab609c4ea96a55e1d2e7c888dc8db4ff",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/github.com/google/closure-library/archive/v20190415.tar.gz",
                        "https://github.com/google/closure-library/archive/v20190415.tar.gz"
                    ],
                    "sha256": "b92f9c2b81adeb06b16e0a5d748baf115eeb58884fe864bec3fe8e23a7cf7d14",
                    "canonical_id": "",
                    "strip_prefix": "closure-library-20190415",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@io_bazel_rules_closure//closure/library:closure_library.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_javascript_closure_library"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_jsinterop_annotations' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:692:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:129:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_jsinterop_annotations",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/maven.ibiblio.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar",
                "http://maven.ibiblio.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar",
                "https://repo1.maven.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar"
            ],
            "jar_sha256": "b2cc45519d62a1144f8cd932fa0c2c30a944c3ae9f060934587a337d81b391c8"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "e65a891acf763d9a78156e261e2bdd843127270c0dbbb49fc779b1be02c27cd8",
                "attributes": {
                    "name": "com_google_jsinterop_annotations",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/maven.ibiblio.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar",
                        "http://maven.ibiblio.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar",
                        "https://repo1.maven.org/maven2/com/google/jsinterop/jsinterop-annotations/1.0.1/jsinterop-annotations-1.0.1.jar"
                    ],
                    "jar_sha256": "b2cc45519d62a1144f8cd932fa0c2c30a944c3ae9f060934587a337d81b391c8"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf_js' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:715:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:133:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_protobuf_js",
            "urls": [
                "https://mirror.bazel.build/github.com/google/protobuf/archive/v3.8.0.tar.gz",
                "https://github.com/protocolbuffers/protobuf/archive/v3.8.0.tar.gz"
            ],
            "sha256": "03d2e5ef101aee4c2f6ddcf145d2a04926b9c19e7086944df3842b1b8502b783",
            "strip_prefix": "protobuf-3.8.0/js",
            "build_file": "@io_bazel_rules_closure//closure/protobuf:protobuf_js.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "9602a04936002476fd6f0c441c971b93a72d2e374867287151d46d6ac6a4cd51",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/github.com/google/protobuf/archive/v3.8.0.tar.gz",
                        "https://github.com/protocolbuffers/protobuf/archive/v3.8.0.tar.gz"
                    ],
                    "sha256": "03d2e5ef101aee4c2f6ddcf145d2a04926b9c19e7086944df3842b1b8502b783",
                    "canonical_id": "",
                    "strip_prefix": "protobuf-3.8.0/js",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@io_bazel_rules_closure//closure/protobuf:protobuf_js.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_protobuf_js"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_google_template_soy' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:727:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:135:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_template_soy",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11.jar",
                "https://repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11.jar"
            ],
            "jar_sha256": "ceb0e78cf1cadefa17493bbd0a913314558e34dd30e4d7d92e406f69c2670725",
            "deps": [
                "@args4j",
                "@com_google_code_findbugs_jsr305",
                "@com_google_code_gson",
                "@com_google_common_html_types",
                "@com_google_guava",
                "@com_google_inject_extensions_guice_assistedinject",
                "@com_google_inject_extensions_guice_multibindings",
                "@com_google_inject_guice",
                "@com_google_protobuf//:protobuf_java",
                "@com_ibm_icu_icu4j",
                "@javax_inject",
                "@org_json",
                "@org_ow2_asm",
                "@org_ow2_asm_analysis",
                "@org_ow2_asm_commons",
                "@org_ow2_asm_util"
            ],
            "extra_build_file_content": "java_binary(\n    name = \"SoyParseInfoGenerator\",\n    main_class = \"com.google.template.soy.SoyParseInfoGenerator\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToJbcSrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToJbcSrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToJsSrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToJsSrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToPySrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToPySrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "5083096198c17e90eb2c5f08efa727dfe3431aeb9a2e830c0978862cff6025e9",
                "attributes": {
                    "name": "com_google_template_soy",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11.jar",
                        "https://repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11.jar"
                    ],
                    "jar_sha256": "ceb0e78cf1cadefa17493bbd0a913314558e34dd30e4d7d92e406f69c2670725",
                    "deps": [
                        "@args4j",
                        "@com_google_code_findbugs_jsr305",
                        "@com_google_code_gson",
                        "@com_google_common_html_types",
                        "@com_google_guava",
                        "@com_google_inject_extensions_guice_assistedinject",
                        "@com_google_inject_extensions_guice_multibindings",
                        "@com_google_inject_guice",
                        "@com_google_protobuf//:protobuf_java",
                        "@com_ibm_icu_icu4j",
                        "@javax_inject",
                        "@org_json",
                        "@org_ow2_asm",
                        "@org_ow2_asm_analysis",
                        "@org_ow2_asm_commons",
                        "@org_ow2_asm_util"
                    ],
                    "extra_build_file_content": "java_binary(\n    name = \"SoyParseInfoGenerator\",\n    main_class = \"com.google.template.soy.SoyParseInfoGenerator\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToJbcSrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToJbcSrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToJsSrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToJsSrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n\njava_binary(\n    name = \"SoyToPySrcCompiler\",\n    main_class = \"com.google.template.soy.SoyToPySrcCompiler\",\n    output_licenses = [\"unencumbered\"],\n    runtime_deps = [\":com_google_template_soy\"],\n)\n"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_template_soy_jssrc' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:770:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:137:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_google_template_soy_jssrc",
            "urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11-jssrc_js.jar",
                "https://repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11-jssrc_js.jar"
            ],
            "sha256": "188a28d3935b0661631bdb518a97d03edd4a597a13a09dd3d92a138c09b59780",
            "type": "zip",
            "build_file": "@io_bazel_rules_closure//closure/templates:soy_jssrc.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "abf65a7e12fe03dbb68796731d7fcba69ec250b0dc680d7bf754b0c0c083b1be",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11-jssrc_js.jar",
                        "https://repo1.maven.org/maven2/com/google/template/soy/2019-03-11/soy-2019-03-11-jssrc_js.jar"
                    ],
                    "sha256": "188a28d3935b0661631bdb518a97d03edd4a597a13a09dd3d92a138c09b59780",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "zip",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@io_bazel_rules_closure//closure/templates:soy_jssrc.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_template_soy_jssrc"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_ibm_icu_icu4j' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:782:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:139:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_ibm_icu_icu4j",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar",
                "https://repo1.maven.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar",
                "http://maven.ibiblio.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar"
            ],
            "jar_sha256": "759d89ed2f8c6a6b627ab954be5913fbdc464f62254a513294e52260f28591ee"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "274e6d79df8caba59f36244668fdf23457d172e4d03df7caa209fc46b9391ea7",
                "attributes": {
                    "name": "com_ibm_icu_icu4j",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar",
                        "https://repo1.maven.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar",
                        "http://maven.ibiblio.org/maven2/com/ibm/icu/icu4j/57.1/icu4j-57.1.jar"
                    ],
                    "jar_sha256": "759d89ed2f8c6a6b627ab954be5913fbdc464f62254a513294e52260f28591ee"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'com_squareup_javapoet' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:794:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:141:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "com_squareup_javapoet",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/com/squareup/javapoet/1.9.0/javapoet-1.9.0.jar",
                "https://repo1.maven.org/maven2/com/squareup/javapoet/1.9.0/javapoet-1.9.0.jar"
            ],
            "jar_sha256": "5bb5abdfe4366c15c0da3332c57d484e238bd48260d6f9d6acf2b08fdde1efea"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "5fb3f09b4afcf04939af5b6c6fe0050d8deeca72e39ba6666789710196b4ed2c",
                "attributes": {
                    "name": "com_squareup_javapoet",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/com/squareup/javapoet/1.9.0/javapoet-1.9.0.jar",
                        "https://repo1.maven.org/maven2/com/squareup/javapoet/1.9.0/javapoet-1.9.0.jar"
                    ],
                    "jar_sha256": "5bb5abdfe4366c15c0da3332c57d484e238bd48260d6f9d6acf2b08fdde1efea"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'fonts_noto_hinted_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:805:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:143:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "fonts_noto_hinted_deb",
            "sha256": "a71fcee2bc7820fc4e0c780bb9c7c6db8364fd2c5bac20867c5c33eed470dc51",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20161116-1_all.deb",
                "http://http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20161116-1_all.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "75a3829daeb12b0b1d92f4ee65bc2cf9225a4387e8766066add5d67f4077721b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a71fcee2bc7820fc4e0c780bb9c7c6db8364fd2c5bac20867c5c33eed470dc51",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20161116-1_all.deb",
                        "http://http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20161116-1_all.deb"
                    ],
                    "name": "fonts_noto_hinted_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'fonts_noto_mono_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:815:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:145:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "fonts_noto_mono_deb",
            "sha256": "71ff715cf50a74a8cc11b02e7c906b69a242d3d677e739e0b2d18cd23b7de375",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20161116-1_all.deb",
                "http://http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20161116-1_all.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "e68a78a49678a1c8055e0d1b7280401d1c508c329027e511f0f1f50bb33cad63",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "71ff715cf50a74a8cc11b02e7c906b69a242d3d677e739e0b2d18cd23b7de375",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20161116-1_all.deb",
                        "http://http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20161116-1_all.deb"
                    ],
                    "name": "fonts_noto_mono_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:74:1",
        "original_attributes": {
            "name": "io_bazel_rules_go",
            "urls": [
                "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.18.6/rules_go-0.18.6.tar.gz",
                "https://github.com/bazelbuild/rules_go/releases/download/0.18.6/rules_go-0.18.6.tar.gz"
            ],
            "sha256": "f04d2373bcaf8aa09bccb08a98a57e721306c8f6043a2a0ee610fd6853dcde3d"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "2b041ea7a35d6e09dc0db63ab00eb661a256a89956baf6811331d35bfd6cd886",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.18.6/rules_go-0.18.6.tar.gz",
                        "https://github.com/bazelbuild/rules_go/releases/download/0.18.6/rules_go-0.18.6.tar.gz"
                    ],
                    "sha256": "f04d2373bcaf8aa09bccb08a98a57e721306c8f6043a2a0ee610fd6853dcde3d",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "io_bazel_rules_go"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'javax_annotation_jsr250_api' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:825:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:147:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "javax_annotation_jsr250_api",
            "licenses": [
                "reciprocal"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar",
                "https://repo1.maven.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar",
                "http://maven.ibiblio.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar"
            ],
            "jar_sha256": "a1a922d0d9b6d183ed3800dfac01d1e1eb159f0e8c6f94736931c1def54a941f"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "3804cd580866994b1d8187a6b80843c457ff9c1207d4e6893b0ca63820cc8296",
                "attributes": {
                    "name": "javax_annotation_jsr250_api",
                    "licenses": [
                        "reciprocal"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar",
                        "https://repo1.maven.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar",
                        "http://maven.ibiblio.org/maven2/javax/annotation/jsr250-api/1.0/jsr250-api-1.0.jar"
                    ],
                    "jar_sha256": "a1a922d0d9b6d183ed3800dfac01d1e1eb159f0e8c6f94736931c1def54a941f"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'javax_inject' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:837:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:149:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "javax_inject",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar",
                "https://repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar",
                "http://maven.ibiblio.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar"
            ],
            "jar_sha256": "91c77044a50c481636c32d916fd89c9118a72195390452c81065080f957de7ff"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "731c5906ed47c2e8e179f9250d22bae732ef529520861736f2f63553ca0a385c",
                "attributes": {
                    "name": "javax_inject",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar",
                        "https://repo1.maven.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar",
                        "http://maven.ibiblio.org/maven2/javax/inject/javax.inject/1/javax.inject-1.jar"
                    ],
                    "jar_sha256": "91c77044a50c481636c32d916fd89c9118a72195390452c81065080f957de7ff"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'jquery' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:53:1",
        "original_attributes": {
            "name": "jquery",
            "urls": [
                "https://github.com/jquery/jquery/archive/3.2.1.tar.gz"
            ],
            "strip_prefix": "jquery-3.2.1",
            "build_file": "//:third_party/jquery.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "1d0f1f0624c6d3b18e834b84c7ee071970f9015964610d550544b428cc22beff",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/jquery/jquery/archive/3.2.1.tar.gz"
                    ],
                    "sha256": "31d8c2e22dd48a7973fe3617cc656fe6b64d2250d07a258cd8ab30ead031c24a",
                    "canonical_id": "",
                    "strip_prefix": "jquery-3.2.1",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "//:third_party/jquery.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "jquery"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'libexpat_amd64_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:849:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:151:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "libexpat_amd64_deb",
            "sha256": "682d2321297c56dec327770efa986d4bef43a5acb1a5528b3098e05652998fae",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u3_amd64.deb",
                "http://http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u3_amd64.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "917daa901da2046a8755e500f4c6e126078acf519ead09f781ff1b90ef838a8d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "682d2321297c56dec327770efa986d4bef43a5acb1a5528b3098e05652998fae",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u3_amd64.deb",
                        "http://http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u3_amd64.deb"
                    ],
                    "name": "libexpat_amd64_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'libfontconfig_amd64_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:859:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:153:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "libfontconfig_amd64_deb",
            "sha256": "0bb54d61c13aa5b5253cb5e08aaca0dfc4c626a05ee30f51d0e3002cda166fec",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3+deb8u1_amd64.deb",
                "http://http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3+deb8u1_amd64.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "26decc627f85ce374de6ff205afd7c6efc5f92eeb03d11893a2170e0f6559179",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0bb54d61c13aa5b5253cb5e08aaca0dfc4c626a05ee30f51d0e3002cda166fec",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3+deb8u1_amd64.deb",
                        "http://http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3+deb8u1_amd64.deb"
                    ],
                    "name": "libfontconfig_amd64_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'libfreetype_amd64_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:869:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:155:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "libfreetype_amd64_deb",
            "sha256": "80184d932f9b0acc130af081c60a2da114c7b1e7531c18c63174498fae47d862",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb",
                "http://http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "43c28f8de9bb2a2546e70bbf1c03d05c370fea6e22d4811083cd7b9ca61c682b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "80184d932f9b0acc130af081c60a2da114c7b1e7531c18c63174498fae47d862",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb",
                        "http://http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb"
                    ],
                    "name": "libfreetype_amd64_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'libpng_amd64_deb' which is a http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:879:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:157:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "libpng_amd64_deb",
            "sha256": "a57b6d53169c67a7754719f4b742c96554a18f931ca5b9e0408fb6502bb77e80",
            "urls": [
                "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb",
                "http://http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "6bc79e667a8348d35a49942945267f2204da38a0585f2a48cfd2e3a955301502",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a57b6d53169c67a7754719f4b742c96554a18f931ca5b9e0408fb6502bb77e80",
                    "urls": [
                        "https://mirror.bazel.build/http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb",
                        "http://http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb"
                    ],
                    "name": "libpng_amd64_deb"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_json' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:900:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:159:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_json",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/json/json/20160212/json-20160212.jar",
                "https://repo1.maven.org/maven2/org/json/json/20160212/json-20160212.jar",
                "http://maven.ibiblio.org/maven2/org/json/json/20160212/json-20160212.jar"
            ],
            "jar_sha256": "0aaf0e7e286ece88fb60b9ba14dd45c05a48e55618876efb7d1b6f19c25e7a29"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "7ae6b1d67af0002882544515b2011c3fc722c95953965dea1b7b5dd9a151d00c",
                "attributes": {
                    "name": "org_json",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/json/json/20160212/json-20160212.jar",
                        "https://repo1.maven.org/maven2/org/json/json/20160212/json-20160212.jar",
                        "http://maven.ibiblio.org/maven2/org/json/json/20160212/json-20160212.jar"
                    ],
                    "jar_sha256": "0aaf0e7e286ece88fb60b9ba14dd45c05a48e55618876efb7d1b6f19c25e7a29"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_jsoup' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:912:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:161:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_jsoup",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/jsoup/jsoup/1.11.3/jsoup-1.11.3.jar",
                "https://repo1.maven.org/maven2/org/jsoup/jsoup/1.11.3/jsoup-1.11.3.jar"
            ],
            "jar_sha256": "df2c71a4240ecbdae7cdcd1667bcf0d747e4e3dcefe8161e787adcff7e5f2fa0"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "19da2c10d88fa5e047a01a5fa72678e62d56eb1975dc8e24ad8ce51f364f63d0",
                "attributes": {
                    "name": "org_jsoup",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/jsoup/jsoup/1.11.3/jsoup-1.11.3.jar",
                        "https://repo1.maven.org/maven2/org/jsoup/jsoup/1.11.3/jsoup-1.11.3.jar"
                    ],
                    "jar_sha256": "df2c71a4240ecbdae7cdcd1667bcf0d747e4e3dcefe8161e787adcff7e5f2fa0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_ow2_asm' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:923:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:163:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_ow2_asm",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm/6.0/asm-6.0.jar",
                "https://repo1.maven.org/maven2/org/ow2/asm/asm/6.0/asm-6.0.jar"
            ],
            "jar_sha256": "dd8971c74a4e697899a8e95caae4ea8760ea6c486dc6b97b1795e75760420461"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "56478114b27bf25254fa78de38afeb7d54589182a68abe3262015f240d867304",
                "attributes": {
                    "name": "org_ow2_asm",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm/6.0/asm-6.0.jar",
                        "https://repo1.maven.org/maven2/org/ow2/asm/asm/6.0/asm-6.0.jar"
                    ],
                    "jar_sha256": "dd8971c74a4e697899a8e95caae4ea8760ea6c486dc6b97b1795e75760420461"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_ow2_asm_analysis' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:934:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:165:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_ow2_asm_analysis",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-analysis/6.0/asm-analysis-6.0.jar",
                "https://repo1.maven.org/maven2/org/ow2/asm/asm-analysis/6.0/asm-analysis-6.0.jar"
            ],
            "jar_sha256": "2f1a6387219c3a6cc4856481f221b03bd9f2408a326d416af09af5d6f608c1f4",
            "exports": [
                "@org_ow2_asm",
                "@org_ow2_asm_tree"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "cba6a17f92646b74e6aa1eb68dd1f130234d0a861cf6ecd3a5a0d6d6a2460782",
                "attributes": {
                    "name": "org_ow2_asm_analysis",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-analysis/6.0/asm-analysis-6.0.jar",
                        "https://repo1.maven.org/maven2/org/ow2/asm/asm-analysis/6.0/asm-analysis-6.0.jar"
                    ],
                    "jar_sha256": "2f1a6387219c3a6cc4856481f221b03bd9f2408a326d416af09af5d6f608c1f4",
                    "exports": [
                        "@org_ow2_asm",
                        "@org_ow2_asm_tree"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_ow2_asm_commons' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:949:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:167:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_ow2_asm_commons",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-commons/6.0/asm-commons-6.0.jar",
                "https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/6.0/asm-commons-6.0.jar"
            ],
            "jar_sha256": "f1bce5c648a96a017bdcd01fe5d59af9845297fd7b79b81c015a6fbbd9719abf",
            "exports": [
                "@org_ow2_asm_tree"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "eb121aa0394cfc2d8d02fd1a14c1fc4a7f557da2e8597e20a240310be38aaa57",
                "attributes": {
                    "name": "org_ow2_asm_commons",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-commons/6.0/asm-commons-6.0.jar",
                        "https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/6.0/asm-commons-6.0.jar"
                    ],
                    "jar_sha256": "f1bce5c648a96a017bdcd01fe5d59af9845297fd7b79b81c015a6fbbd9719abf",
                    "exports": [
                        "@org_ow2_asm_tree"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_ow2_asm_tree' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:961:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:169:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_ow2_asm_tree",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-tree/6.0/asm-tree-6.0.jar",
                "https://repo1.maven.org/maven2/org/ow2/asm/asm-tree/6.0/asm-tree-6.0.jar"
            ],
            "jar_sha256": "887998fb69727c8759e4d253f856822801e33f9fd4caa566b3ac58ee92106215",
            "exports": [
                "@org_ow2_asm"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "16dad9df7324e24a9a7b410b54194d11930a423262697ebab51e80f12435b59c",
                "attributes": {
                    "name": "org_ow2_asm_tree",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-tree/6.0/asm-tree-6.0.jar",
                        "https://repo1.maven.org/maven2/org/ow2/asm/asm-tree/6.0/asm-tree-6.0.jar"
                    ],
                    "jar_sha256": "887998fb69727c8759e4d253f856822801e33f9fd4caa566b3ac58ee92106215",
                    "exports": [
                        "@org_ow2_asm"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
        "definition_information": "Call stack for the definition of repository 'org_ow2_asm_util' which is a java_import_external (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/java_import_external.bzl:113:24):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:973:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:171:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "org_ow2_asm_util",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-util/6.0/asm-util-6.0.jar",
                "https://repo1.maven.org/maven2/org/ow2/asm/asm-util/6.0/asm-util-6.0.jar"
            ],
            "jar_sha256": "356afebdb0f870175262e5188f8709a3b17aa2a5a6a4b0340b04d4b449bca5f6",
            "exports": [
                "@org_ow2_asm_analysis",
                "@org_ow2_asm_tree"
            ]
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:java_import_external.bzl%java_import_external",
                "output_tree_hash": "2d29352246c9895e2ee472c66c6bf07c2c1bd431b300cf317ab49948c90c6583",
                "attributes": {
                    "name": "org_ow2_asm_util",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "https://mirror.bazel.build/repo1.maven.org/maven2/org/ow2/asm/asm-util/6.0/asm-util-6.0.jar",
                        "https://repo1.maven.org/maven2/org/ow2/asm/asm-util/6.0/asm-util-6.0.jar"
                    ],
                    "jar_sha256": "356afebdb0f870175262e5188f8709a3b17aa2a5a6a4b0340b04d4b449bca5f6",
                    "exports": [
                        "@org_ow2_asm_analysis",
                        "@org_ow2_asm_tree"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_closure//closure/private:platform_http_file.bzl%platform_http_file",
        "definition_information": "Call stack for the definition of repository 'phantomjs' which is a platform_http_file (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/private/platform_http_file.bzl:37:22):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:988:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_closure/closure/repositories.bzl:173:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:39:1",
        "original_attributes": {
            "name": "phantomjs",
            "amd64_urls": [
                "https://mirror.bazel.build/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2",
                "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2"
            ],
            "amd64_sha256": "86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f",
            "macos_urls": [
                "https://mirror.bazel.build/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip",
                "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip"
            ],
            "macos_sha256": "538cf488219ab27e309eafc629e2bcee9976990fe90b1ec334f541779150f8c1"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_closure//closure/private:platform_http_file.bzl%platform_http_file",
                "output_tree_hash": "c2cf0b57d322e0385fbd626fdf4b9d0dadd394d1d507305f772253adfb735557",
                "attributes": {
                    "name": "phantomjs",
                    "amd64_urls": [
                        "https://mirror.bazel.build/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2",
                        "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2"
                    ],
                    "amd64_sha256": "86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f",
                    "macos_urls": [
                        "https://mirror.bazel.build/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip",
                        "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip"
                    ],
                    "macos_sha256": "538cf488219ab27e309eafc629e2bcee9976990fe90b1ec334f541779150f8c1"
                }
            }
        ]
    },
    {
        "original_rule_class": "new_local_repository",
        "original_attributes": {
            "name": "processing_js",
            "path": "third_party",
            "build_file": "//:third_party/processing-js.BUILD"
        },
        "native": "new_local_repository(name = \"processing_js\", path = \"third_party\", build_file = \"//:third_party/processing-js.BUILD\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "zlib",
            "actual": "@net_zlib//:zlib"
        },
        "native": "bind(name = \"zlib\", actual = \"@net_zlib//:zlib\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'bazel_gazelle' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:89:1",
        "original_attributes": {
            "name": "bazel_gazelle",
            "urls": [
                "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.17.0/bazel-gazelle-0.17.0.tar.gz"
            ],
            "sha256": "3c681998538231a2d24d0c07ed5a7658cb72bfb5fd4bf9911157c0e9ac6a2687"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "aa23c8092431347db277438d918f41ab9651fca8b8b69cba12417ed0f14d0799",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.17.0/bazel-gazelle-0.17.0.tar.gz"
                    ],
                    "sha256": "3c681998538231a2d24d0c07ed5a7658cb72bfb5fd4bf9911157c0e9ac6a2687",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "bazel_gazelle"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_gogo_protobuf' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:114:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "com_github_gogo_protobuf",
            "remote": "https://github.com/gogo/protobuf",
            "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
            "shallow_since": "1550471403 +0200",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "ad98c6f044e92b8b96f1328663de333ad868936a4aefc484e0590d35dc5b6e8c",
                "attributes": {
                    "remote": "https://github.com/gogo/protobuf",
                    "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
                    "shallow_since": "1550471403 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_gogo_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_glog' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:205:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "com_github_golang_glog",
            "remote": "https://github.com/golang/glog",
            "commit": "23def4e6c14b4da8ac2ed8007337bc5eb5007998",
            "shallow_since": "1453852388 +1100",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_golang_glog-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "7eda041577d96c36f700dc8613f2aab0cdd5c811226acee1da491d1ee970cb8b",
                "attributes": {
                    "remote": "https://github.com/golang/glog",
                    "commit": "23def4e6c14b4da8ac2ed8007337bc5eb5007998",
                    "shallow_since": "1453852388 +1100",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_golang_glog-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_golang_glog"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_protobuf' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:54:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "com_github_golang_protobuf",
            "remote": "https://github.com/golang/protobuf",
            "commit": "c823c79ea1570fb5ff454033735a8e68575d1d0f",
            "shallow_since": "1549405252 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "17d610419e010992e40c13e41173894e972cc0cbd6ccc3a840dc176f67f8f451",
                "attributes": {
                    "remote": "https://github.com/golang/protobuf",
                    "commit": "c823c79ea1570fb5ff454033735a8e68575d1d0f",
                    "shallow_since": "1549405252 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_golang_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_kevinburke_go_bindata' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:215:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "com_github_kevinburke_go_bindata",
            "remote": "https://github.com/kevinburke/go-bindata",
            "commit": "53d73b98acf3bd9f56d7f9136ed8e1be64756e1d",
            "shallow_since": "1545009224 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_kevinburke_go_bindata-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "e8fd15ff263a3c7806ee60824d956ee27d3e038397f134a9f91c602ed0384262",
                "attributes": {
                    "remote": "https://github.com/kevinburke/go-bindata",
                    "commit": "53d73b98acf3bd9f56d7f9136ed8e1be64756e1d",
                    "shallow_since": "1545009224 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_kevinburke_go_bindata-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_kevinburke_go_bindata"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_mwitkow_go_proto_validators' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:103:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "com_github_mwitkow_go_proto_validators",
            "remote": "https://github.com/mwitkow/go-proto-validators",
            "commit": "1f388280e944c97cc59c75d8c84a704097d1f1d6",
            "shallow_since": "1549963709 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "7a5296db2c61c4f29640be92187eee52d3bca563b79e388295e4ed0f3653a58d",
                "attributes": {
                    "remote": "https://github.com/mwitkow/go-proto-validators",
                    "commit": "1f388280e944c97cc59c75d8c84a704097d1f1d6",
                    "shallow_since": "1549963709 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_mwitkow_go_proto_validators"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'go_googleapis' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:188:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "go_googleapis",
            "remote": "https://github.com/googleapis/googleapis",
            "commit": "41d72d444fbe445f4da89e13be02078734fb7875",
            "shallow_since": "1551404057 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
            ],
            "patch_args": [
                "-E",
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "c2c13316fddd42222a3f95f790ee76f3a8f4fc9a05a43c5ff3cc805175aa2dcb",
                "attributes": {
                    "remote": "https://github.com/googleapis/googleapis",
                    "commit": "41d72d444fbe445f4da89e13be02078734fb7875",
                    "shallow_since": "1551404057 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-E",
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "go_googleapis"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
        "definition_information": "Call stack for the definition of repository 'go_sdk' which is a _go_download_sdk (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/sdk.bzl:53:20):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/sdk.bzl:65:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/toolchain/toolchains.bzl:405:13\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:87:1",
        "original_attributes": {
            "name": "go_sdk",
            "sdks": {
                "darwin_amd64": [
                    "go1.12.6.darwin-amd64.tar.gz",
                    "b12bbac3227e72c2964e638e85d6621996bd3c03e172e752334112c3f757ba6e"
                ],
                "freebsd_386": [
                    "go1.12.6.freebsd-386.tar.gz",
                    "5dcdffc8102ff1f53596b7cf0da83d66b1f3f59180e050cb299499aa731f68ac"
                ],
                "freebsd_amd64": [
                    "go1.12.6.freebsd-amd64.tar.gz",
                    "93a273bf283292142fc505bb18a3996e73009d9451c0c245b72013728da3f0af"
                ],
                "linux_386": [
                    "go1.12.6.linux-386.tar.gz",
                    "7aaf25164a9ab5e1005c15535ed16ee122df50ac192c2d79b7940315c2b74f2c"
                ],
                "linux_amd64": [
                    "go1.12.6.linux-amd64.tar.gz",
                    "dbcf71a3c1ea53b8d54ef1b48c85a39a6c9a935d01fc8291ff2b92028e59913c"
                ],
                "linux_arm64": [
                    "go1.12.6.linux-arm64.tar.gz",
                    "8f4e3909c74b4f3f3956715f32419b28d32a4ad57dbd79f74b7a8a920b21a1a3"
                ],
                "linux_arm": [
                    "go1.12.6.linux-armv6l.tar.gz",
                    "0708fbc125e7b782b44d450f3a3864859419b3691121ad401f1b9f00e488bddb"
                ],
                "linux_ppc64le": [
                    "go1.12.6.linux-ppc64le.tar.gz",
                    "67eacb68c1e251c1428e588776c5a02e287a508e3d44f940d31d8ff5d57f0eef"
                ],
                "linux_s390x": [
                    "go1.12.6.linux-s390x.tar.gz",
                    "c14baa10b87a38e56f28a176fae8a839e9052b0e691bdc0461677d4bcedea9aa"
                ],
                "windows_386": [
                    "go1.12.6.windows-386.zip",
                    "9d5644ef8e94ad0853e1a86d5465a4600fe5b2cedc946fff80de46135eab2486"
                ],
                "windows_amd64": [
                    "go1.12.6.windows-amd64.zip",
                    "9badf7bbc0ed55f2db967434b033a2cddf2e46dbdc5bb8560d8fde019e8e19d3"
                ]
            }
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
                "output_tree_hash": "64fb24f421811c36848b7656c05f6fc961784834219eab17e2091320a27984f0",
                "attributes": {
                    "name": "go_sdk",
                    "sdks": {
                        "darwin_amd64": [
                            "go1.12.6.darwin-amd64.tar.gz",
                            "b12bbac3227e72c2964e638e85d6621996bd3c03e172e752334112c3f757ba6e"
                        ],
                        "freebsd_386": [
                            "go1.12.6.freebsd-386.tar.gz",
                            "5dcdffc8102ff1f53596b7cf0da83d66b1f3f59180e050cb299499aa731f68ac"
                        ],
                        "freebsd_amd64": [
                            "go1.12.6.freebsd-amd64.tar.gz",
                            "93a273bf283292142fc505bb18a3996e73009d9451c0c245b72013728da3f0af"
                        ],
                        "linux_386": [
                            "go1.12.6.linux-386.tar.gz",
                            "7aaf25164a9ab5e1005c15535ed16ee122df50ac192c2d79b7940315c2b74f2c"
                        ],
                        "linux_amd64": [
                            "go1.12.6.linux-amd64.tar.gz",
                            "dbcf71a3c1ea53b8d54ef1b48c85a39a6c9a935d01fc8291ff2b92028e59913c"
                        ],
                        "linux_arm64": [
                            "go1.12.6.linux-arm64.tar.gz",
                            "8f4e3909c74b4f3f3956715f32419b28d32a4ad57dbd79f74b7a8a920b21a1a3"
                        ],
                        "linux_arm": [
                            "go1.12.6.linux-armv6l.tar.gz",
                            "0708fbc125e7b782b44d450f3a3864859419b3691121ad401f1b9f00e488bddb"
                        ],
                        "linux_ppc64le": [
                            "go1.12.6.linux-ppc64le.tar.gz",
                            "67eacb68c1e251c1428e588776c5a02e287a508e3d44f940d31d8ff5d57f0eef"
                        ],
                        "linux_s390x": [
                            "go1.12.6.linux-s390x.tar.gz",
                            "c14baa10b87a38e56f28a176fae8a839e9052b0e691bdc0461677d4bcedea9aa"
                        ],
                        "windows_386": [
                            "go1.12.6.windows-386.zip",
                            "9d5644ef8e94ad0853e1a86d5465a4600fe5b2cedc946fff80de46135eab2486"
                        ],
                        "windows_amd64": [
                            "go1.12.6.windows-amd64.zip",
                            "9badf7bbc0ed55f2db967434b033a2cddf2e46dbdc5bb8560d8fde019e8e19d3"
                        ]
                    }
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
        "definition_information": "Call stack for the definition of repository 'gogo_special_proto' which is a gogo_special_proto (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/proto/gogo.bzl:34:22):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:125:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "gogo_special_proto"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
                "output_tree_hash": "f352a36f8c81aa0ab46e41070dd0d0e3a7165247b30fcc13e56d6edab7986410",
                "attributes": {
                    "name": "gogo_special_proto"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go_compat' which is a _go_rules_compat (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:33:20):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:55:5\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:32:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "io_bazel_rules_go_compat",
            "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
                "output_tree_hash": "e4cc1f8a56348e70afa41035703ad4cfde6b60392ddfc346193b0ea9ad06ecd1",
                "attributes": {
                    "name": "io_bazel_rules_go_compat",
                    "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_nogo' which is a go_register_nogo (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/nogo.bzl:33:20):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:229:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "io_bazel_rules_nogo",
            "nogo": "@io_bazel_rules_go//:default_nogo"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
                "output_tree_hash": "3934c1fa667e35c1bdda975bca7059807ede9fc322e1daa480ab77939375185b",
                "attributes": {
                    "name": "io_bazel_rules_nogo",
                    "nogo": "@io_bazel_rules_go//:default_nogo"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'net_zlib' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:95:9\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "net_zlib",
            "urls": [
                "https://zlib.net/zlib-1.2.11.tar.gz"
            ],
            "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            "strip_prefix": "zlib-1.2.11",
            "build_file": "@com_google_protobuf//:third_party/zlib.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "3491f7a711ed5fda5fef8b3ab5140a220d5d410c30c76262fa431aa49c3d4fc0",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://zlib.net/zlib-1.2.11.tar.gz"
                    ],
                    "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
                    "canonical_id": "",
                    "strip_prefix": "zlib-1.2.11",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@com_google_protobuf//:third_party/zlib.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "net_zlib"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_google_genproto' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:177:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_google_genproto",
            "remote": "https://github.com/google/go-genproto",
            "commit": "4f5b463f9597cbe0dd13a6a2cd4f85e788d27508",
            "shallow_since": "1551303189 -0700",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "b3bba82b52637caa08288eaf3e032e3cbd144298f0deef5041d67b758f41df3c",
                "attributes": {
                    "remote": "https://github.com/google/go-genproto",
                    "commit": "4f5b463f9597cbe0dd13a6a2cd4f85e788d27508",
                    "shallow_since": "1551303189 -0700",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_google_genproto"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_google_grpc' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:163:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_google_grpc",
            "remote": "https://github.com/grpc/grpc-go",
            "commit": "2fdaae294f38ed9a121193c51ec99fecd3b13eb7",
            "shallow_since": "1551206709 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_google_grpc-gazelle.patch",
                "@io_bazel_rules_go//third_party:org_golang_google_grpc-crosscompile.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "909700c0ea8bb33ce759c7b39be881001271ee3e53d9055cc3be077133eccf10",
                "attributes": {
                    "remote": "https://github.com/grpc/grpc-go",
                    "commit": "2fdaae294f38ed9a121193c51ec99fecd3b13eb7",
                    "shallow_since": "1551206709 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_google_grpc-gazelle.patch",
                        "@io_bazel_rules_go//third_party:org_golang_google_grpc-crosscompile.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_google_grpc"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_net' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:131:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_x_net",
            "remote": "https://go.googlesource.com/net",
            "commit": "16b79f2e4e95ea23b2bf9903c9809ff7b013ce85",
            "shallow_since": "1551482021 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_net-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "36b3b8e2f1951b727d5715782c8184f5c33798a7715a4436283a0a024a02bc70",
                "attributes": {
                    "remote": "https://go.googlesource.com/net",
                    "commit": "16b79f2e4e95ea23b2bf9903c9809ff7b013ce85",
                    "shallow_since": "1551482021 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_net-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_x_net"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_sys' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:152:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_x_sys",
            "remote": "https://go.googlesource.com/sys",
            "commit": "d455e41777fca6e8a5a79e34a14b8368bc11d9ba",
            "shallow_since": "1551616002 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_sys-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "f1786abbb0018ca092cbd42fb48bf651e608d02d722ebb455caa428061d86f1e",
                "attributes": {
                    "remote": "https://go.googlesource.com/sys",
                    "commit": "d455e41777fca6e8a5a79e34a14b8368bc11d9ba",
                    "shallow_since": "1551616002 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_sys-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_x_sys"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_text' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:142:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_x_text",
            "remote": "https://go.googlesource.com/text",
            "commit": "f21a4dfb5e38f5895301dc265a8def02365cc3d0",
            "shallow_since": "1513256923 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_text-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "f6681ddbb201ad58669c67fd61c89cf75cab90cc272e3ae1255a732e8f13644d",
                "attributes": {
                    "remote": "https://go.googlesource.com/text",
                    "commit": "f21a4dfb5e38f5895301dc265a8def02365cc3d0",
                    "shallow_since": "1513256923 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_text-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_x_text"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_tools' which is a git_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/io_bazel_rules_go/go/private/repositories.bzl:38:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:85:1",
        "original_attributes": {
            "name": "org_golang_x_tools",
            "remote": "https://go.googlesource.com/tools",
            "commit": "589c23e65e65055d47b9ad4a99723bc389136265",
            "shallow_since": "1551386336 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "951b90969912f32963ae9348341ad1f017bc0ef387105d802e839ac110a056eb",
                "attributes": {
                    "remote": "https://go.googlesource.com/tools",
                    "commit": "589c23e65e65055d47b9ad4a99723bc389136265",
                    "shallow_since": "1551386336 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_x_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository_tools",
        "definition_information": "Call stack for the definition of repository 'bazel_gazelle_go_repository_tools' which is a go_repository_tools (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:275:23):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/deps.bzl:36:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:97:1",
        "original_attributes": {
            "name": "bazel_gazelle_go_repository_tools",
            "go_sdk": "@go_sdk//:ROOT"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository_tools",
                "output_tree_hash": "dd69453a685566246176a71a19f81f4753fa0881b5d20a77df3283608949d366",
                "attributes": {
                    "name": "bazel_gazelle_go_repository_tools",
                    "go_sdk": "@go_sdk//:ROOT"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'build_bazel_rules_nodejs' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:157:1",
        "original_attributes": {
            "name": "build_bazel_rules_nodejs",
            "urls": [
                "https://github.com/bazelbuild/rules_nodejs/releases/download/0.32.0/rules_nodejs-0.32.0.tar.gz"
            ],
            "sha256": "06cb04f4f745e37d542ec6883a2896029715a591c0e44c5d250a268d3752f865"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "68da3f0c3a3645eb9eb24f8e2c979a4d5b8b60f3173513d9630656f754fc6d8b",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/rules_nodejs/releases/download/0.32.0/rules_nodejs-0.32.0.tar.gz"
                    ],
                    "sha256": "06cb04f4f745e37d542ec6883a2896029715a591c0e44c5d250a268d3752f865",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "build_bazel_rules_nodejs"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_PuerkitoBio_goquery' which is a go_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:122:17):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:113:1",
        "original_attributes": {
            "name": "com_github_PuerkitoBio_goquery",
            "importpath": "github.com/PuerkitoBio/goquery",
            "urls": [
                "https://github.com/PuerkitoBio/goquery/archive/v1.1.0.tar.gz"
            ],
            "strip_prefix": "goquery-1.1.0",
            "sha256": "8242ca59ecb79aada1463ee327304953ad49bb5053807e79e2ad07e8d70a00c6"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
                "output_tree_hash": "e8c0b701d18d51639ccf225f48b8583b41ec5688304006cbb0f2b5b95c8d368b",
                "attributes": {
                    "name": "com_github_PuerkitoBio_goquery",
                    "importpath": "github.com/PuerkitoBio/goquery",
                    "urls": [
                        "https://github.com/PuerkitoBio/goquery/archive/v1.1.0.tar.gz"
                    ],
                    "strip_prefix": "goquery-1.1.0",
                    "sha256": "8242ca59ecb79aada1463ee327304953ad49bb5053807e79e2ad07e8d70a00c6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_andybalholm_cascadia' which is a go_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:122:17):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:102:1",
        "original_attributes": {
            "name": "com_github_andybalholm_cascadia",
            "importpath": "github.com/andybalholm/cascadia",
            "commit": "349dd0209470eabd9514242c688c403c0926d266",
            "vcs": "git",
            "remote": "https://github.com/andybalholm/cascadia.git"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
                "output_tree_hash": "b25f06d5fcf019fe5d7ffd61c81d1c4013729f23fab941f96df93772d74ecf52",
                "attributes": {
                    "name": "com_github_andybalholm_cascadia",
                    "importpath": "github.com/andybalholm/cascadia",
                    "commit": "349dd0209470eabd9514242c688c403c0926d266",
                    "vcs": "git",
                    "remote": "https://github.com/andybalholm/cascadia.git"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_net' which is a go_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:122:17):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:124:1",
        "original_attributes": {
            "name": "com_github_golang_net",
            "importpath": "golang.org/x/net",
            "commit": "42fe2e1c20de1054d3d30f82cc9fb5b41e2e3767",
            "vcs": "git",
            "remote": "https://github.com/golang/net.git"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
                "output_tree_hash": "dfdb379f656caff123dd5936ff7f9a826501277de1184ea21c2404aaff3c39db",
                "attributes": {
                    "name": "com_github_golang_net",
                    "importpath": "golang.org/x/net",
                    "commit": "42fe2e1c20de1054d3d30f82cc9fb5b41e2e3767",
                    "vcs": "git",
                    "remote": "https://github.com/golang/net.git"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_russross_blackfriday' which is a go_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:122:17):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:135:1",
        "original_attributes": {
            "name": "com_github_russross_blackfriday",
            "importpath": "gopkg.in/russross/blackfriday.v2",
            "commit": "cadec560ec52d93835bf2f15bd794700d3a2473b",
            "vcs": "git",
            "remote": "https://github.com/russross/blackfriday"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
                "output_tree_hash": "9d6189a4b6c58727f64bf03c5b27c4178ff66991bfaa83a1a7ed4d9b39c88683",
                "attributes": {
                    "name": "com_github_russross_blackfriday",
                    "importpath": "gopkg.in/russross/blackfriday.v2",
                    "commit": "cadec560ec52d93835bf2f15bd794700d3a2473b",
                    "vcs": "git",
                    "remote": "https://github.com/russross/blackfriday"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_shurcool_sanitized_anchor_name' which is a go_repository (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_gazelle/internal/go_repository.bzl:122:17):\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:146:1",
        "original_attributes": {
            "name": "com_github_shurcool_sanitized_anchor_name",
            "importpath": "github.com/shurcooL/sanitized_anchor_name",
            "commit": "86672fcb3f950f35f2e675df2240550f2a50762f",
            "vcs": "git",
            "remote": "https://github.com/shurcooL/sanitized_anchor_name"
        },
        "repositories": [
            {
                "rule_class": "@bazel_gazelle//internal:go_repository.bzl%go_repository",
                "output_tree_hash": "971c15f7a5d700e24100fa659fa84f4f80a5c4321f279aca13b5fd346bf6388f",
                "attributes": {
                    "name": "com_github_shurcool_sanitized_anchor_name",
                    "importpath": "github.com/shurcooL/sanitized_anchor_name",
                    "commit": "86672fcb3f950f35f2e675df2240550f2a50762f",
                    "vcs": "git",
                    "remote": "https://github.com/shurcooL/sanitized_anchor_name"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
        "definition_information": "Call stack for the definition of repository 'build_bazel_rules_nodejs_rollup_deps' which is a yarn_install (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/npm_install/npm_install.bzl:382:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:627:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:591:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:165:1",
        "original_attributes": {
            "name": "build_bazel_rules_nodejs_rollup_deps",
            "data": [
                "@build_bazel_rules_nodejs//internal/rollup:postinstall-patches.js"
            ],
            "package_json": "@build_bazel_rules_nodejs//internal/rollup:package.json",
            "symlink_node_modules": False,
            "yarn_lock": "@build_bazel_rules_nodejs//internal/rollup:yarn.lock"
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
                "output_tree_hash": "ec5f683c043c67cb15de643daacc7a7ce1a3b51b814d67fa283b26932c83e640",
                "attributes": {
                    "name": "build_bazel_rules_nodejs_rollup_deps",
                    "data": [
                        "@build_bazel_rules_nodejs//internal/rollup:postinstall-patches.js"
                    ],
                    "package_json": "@build_bazel_rules_nodejs//internal/rollup:package.json",
                    "symlink_node_modules": False,
                    "yarn_lock": "@build_bazel_rules_nodejs//internal/rollup:yarn.lock"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
        "definition_information": "Call stack for the definition of repository 'history-server_runtime_deps' which is a yarn_install (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/npm_install/npm_install.bzl:382:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:627:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:603:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:165:1",
        "original_attributes": {
            "name": "history-server_runtime_deps",
            "package_json": "@build_bazel_rules_nodejs//internal/history-server:package.json",
            "symlink_node_modules": False,
            "yarn_lock": "@build_bazel_rules_nodejs//internal/history-server:yarn.lock"
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
                "output_tree_hash": "65a3a867204c76ae41eb7b2c576127215577a324d8bcea6b9611a14a970ae1cd",
                "attributes": {
                    "name": "history-server_runtime_deps",
                    "package_json": "@build_bazel_rules_nodejs//internal/history-server:package.json",
                    "symlink_node_modules": False,
                    "yarn_lock": "@build_bazel_rules_nodejs//internal/history-server:yarn.lock"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
        "definition_information": "Call stack for the definition of repository 'http-server_runtime_deps' which is a yarn_install (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/npm_install/npm_install.bzl:382:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:627:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:614:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:165:1",
        "original_attributes": {
            "name": "http-server_runtime_deps",
            "package_json": "@build_bazel_rules_nodejs//internal/http-server:package.json",
            "symlink_node_modules": False,
            "yarn_lock": "@build_bazel_rules_nodejs//internal/http-server:yarn.lock"
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
                "output_tree_hash": "0adece89f16860d34ddf9a46ed861fe8d7c17a1abe0530e4f1bc9c53d2289037",
                "attributes": {
                    "name": "http-server_runtime_deps",
                    "package_json": "@build_bazel_rules_nodejs//internal/http-server:package.json",
                    "symlink_node_modules": False,
                    "yarn_lock": "@build_bazel_rules_nodejs//internal/http-server:yarn.lock"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/node:node_repositories.bzl%_nodejs_repo",
        "definition_information": "Call stack for the definition of repository 'nodejs' which is a _nodejs_repo (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:453:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:627:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:570:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:165:1",
        "original_attributes": {
            "name": "nodejs",
            "node_repositories": {
                "10.10.0-darwin_amd64": [
                    "node-v10.10.0-darwin-x64.tar.gz",
                    "node-v10.10.0-darwin-x64",
                    "00b7a8426e076e9bf9d12ba2d571312e833fe962c70afafd10ad3682fdeeaa5e"
                ],
                "10.10.0-linux_amd64": [
                    "node-v10.10.0-linux-x64.tar.xz",
                    "node-v10.10.0-linux-x64",
                    "686d2c7b7698097e67bcd68edc3d6b5d28d81f62436c7cf9e7779d134ec262a9"
                ],
                "10.10.0-windows_amd64": [
                    "node-v10.10.0-win-x64.zip",
                    "node-v10.10.0-win-x64",
                    "70c46e6451798be9d052b700ce5dadccb75cf917f6bf0d6ed54344c856830cfb"
                ],
                "10.13.0-darwin_amd64": [
                    "node-v10.13.0-darwin-x64.tar.gz",
                    "node-v10.13.0-darwin-x64",
                    "815a5d18516934a3963ace9f0574f7d41f0c0ce9186a19be3d89e039e57598c5"
                ],
                "10.13.0-linux_amd64": [
                    "node-v10.13.0-linux-x64.tar.xz",
                    "node-v10.13.0-linux-x64",
                    "0dc6dba645550b66f8f00541a428c29da7c3cde32fb7eda2eb626a9db3bbf08d"
                ],
                "10.13.0-windows_amd64": [
                    "node-v10.13.0-win-x64.zip",
                    "node-v10.13.0-win-x64",
                    "eb09c9e9677f1919ec1ca78623c09b2a718ec5388b72b7662d5c41e5f628a52c"
                ],
                "10.3.0-darwin_amd64": [
                    "node-v10.3.0-darwin-x64.tar.gz",
                    "node-v10.3.0-darwin-x64",
                    "0bb5b7e3fe8cccda2abda958d1eb0408f1518a8b0cb58b75ade5d507cd5d6053"
                ],
                "10.3.0-linux_amd64": [
                    "node-v10.3.0-linux-x64.tar.xz",
                    "node-v10.3.0-linux-x64",
                    "eb3c3e2585494699716ad3197c8eedf4003d3f110829b30c5a0dc34414c47423"
                ],
                "10.3.0-windows_amd64": [
                    "node-v10.3.0-win-x64.zip",
                    "node-v10.3.0-win-x64",
                    "65d586afb087406a2800d8e51f664c88b26d510f077b85a3b177a1bb79f73677"
                ],
                "10.9.0-darwin_amd64": [
                    "node-v10.9.0-darwin-x64.tar.gz",
                    "node-v10.9.0-darwin-x64",
                    "3c4fe75dacfcc495a432a7ba2dec9045cff359af2a5d7d0429c84a424ef686fc"
                ],
                "10.9.0-linux_amd64": [
                    "node-v10.9.0-linux-x64.tar.xz",
                    "node-v10.9.0-linux-x64",
                    "c5acb8b7055ee0b6ac653dc4e458c5db45348cecc564b388f4ed1def84a329ff"
                ],
                "10.9.0-windows_amd64": [
                    "node-v10.9.0-win-x64.zip",
                    "node-v10.9.0-win-x64",
                    "6a75cdbb69d62ed242d6cbf0238a470bcbf628567ee339d4d098a5efcda2401e"
                ],
                "8.11.1-darwin_amd64": [
                    "node-v8.11.1-darwin-x64.tar.gz",
                    "node-v8.11.1-darwin-x64",
                    "5c7b05899ff56910a2b8180f139d48612f349ac2c5d20f08dbbeffbed9e3a089"
                ],
                "8.11.1-linux_amd64": [
                    "node-v8.11.1-linux-x64.tar.xz",
                    "node-v8.11.1-linux-x64",
                    "6617e245fa0f7fbe0e373e71d543fea878315324ab31dc64b4eba10e42d04c11"
                ],
                "8.11.1-windows_amd64": [
                    "node-v8.11.1-win-x64.zip",
                    "node-v8.11.1-win-x64",
                    "7d49b59c2b5d73a14c138e8a215d558a64a5241cd5035d9824f608e7bba097b1"
                ],
                "8.12.0-darwin_amd64": [
                    "node-v8.12.0-darwin-x64.tar.gz",
                    "node-v8.12.0-darwin-x64",
                    "ca131b84dfcf2b6f653a6521d31f7a108ad7d83f4d7e781945b2eca8172064aa"
                ],
                "8.12.0-linux_amd64": [
                    "node-v8.12.0-linux-x64.tar.xz",
                    "node-v8.12.0-linux-x64",
                    "29a20479cd1e3a03396a4e74a1784ccdd1cf2f96928b56f6ffa4c8dae40c88f2"
                ],
                "8.12.0-windows_amd64": [
                    "node-v8.12.0-win-x64.zip",
                    "node-v8.12.0-win-x64",
                    "9b22c9b23148b61ea0052826b3ac0255b8a3a542c125272b8f014f15bf11b091"
                ],
                "8.9.1-darwin_amd64": [
                    "node-v8.9.1-darwin-x64.tar.gz",
                    "node-v8.9.1-darwin-x64",
                    "05c992a6621d28d564b92bf3051a5dc0adf83839237c0d4653a8cdb8a1c73b94"
                ],
                "8.9.1-linux_amd64": [
                    "node-v8.9.1-linux-x64.tar.xz",
                    "node-v8.9.1-linux-x64",
                    "8be82805f7c1ab3e64d4569fb9a90ded2de78dd27cadbb91bad1bf975dae1e2d"
                ],
                "8.9.1-windows_amd64": [
                    "node-v8.9.1-win-x64.zip",
                    "node-v8.9.1-win-x64",
                    "db89c6e041da359561fbe7da075bb4f9881a0f7d3e98c203e83732cfb283fa4a"
                ],
                "9.11.1-darwin_amd64": [
                    "node-v9.11.1-darwin-x64.tar.gz",
                    "node-v9.11.1-darwin-x64",
                    "7b1fb394aa41a62b477e36df16644bd383cc9084808511f6cd318b835a06aac6"
                ],
                "9.11.1-linux_amd64": [
                    "node-v9.11.1-linux-x64.tar.xz",
                    "node-v9.11.1-linux-x64",
                    "4d27a95d5c2f1c8ef99118794c9c4903e63963418d3e16ca7576760cff39879b"
                ],
                "9.11.1-windows_amd64": [
                    "node-v9.11.1-win-x64.zip",
                    "node-v9.11.1-win-x64",
                    "0a3566d57ccb7fed95d18fc6c3bc1552a1b1e4753f9bc6c5d45e04f325e1ee53"
                ]
            },
            "node_urls": [
                "https://mirror.bazel.build/nodejs.org/dist/v{version}/{filename}",
                "https://nodejs.org/dist/v{version}/{filename}"
            ],
            "node_version": "10.13.0",
            "package_json": [
                "//:package.json"
            ],
            "preserve_symlinks": True,
            "yarn_repositories": {
                "1.12.1": [
                    "yarn-v1.12.1.tar.gz",
                    "yarn-v1.12.1",
                    "09bea8f4ec41e9079fa03093d3b2db7ac5c5331852236d63815f8df42b3ba88d"
                ],
                "1.12.3": [
                    "yarn-v1.12.3.tar.gz",
                    "yarn-v1.12.3",
                    "02cd4b589ec22c4bdbd2bc5ebbfd99c5e99b07242ad68a539cb37896b93a24f2"
                ],
                "1.13.0": [
                    "yarn-v1.13.0.tar.gz",
                    "yarn-v1.13.0",
                    "125d40ebf621ebb08e3f66a618bd2cc5cd77fa317a312900a1ab4360ed38bf14"
                ],
                "1.3.2": [
                    "yarn-v1.3.2.tar.gz",
                    "yarn-v1.3.2",
                    "6cfe82e530ef0837212f13e45c1565ba53f5199eec2527b85ecbcd88bf26821d"
                ],
                "1.5.1": [
                    "yarn-v1.5.1.tar.gz",
                    "yarn-v1.5.1",
                    "cd31657232cf48d57fdbff55f38bfa058d2fb4950450bd34af72dac796af4de1"
                ],
                "1.6.0": [
                    "yarn-v1.6.0.tar.gz",
                    "yarn-v1.6.0",
                    "a57b2fdb2bfeeb083d45a883bc29af94d5e83a21c25f3fc001c295938e988509"
                ],
                "1.9.2": [
                    "yarn-v1.9.2.tar.gz",
                    "yarn-v1.9.2",
                    "3ad69cc7f68159a562c676e21998eb21b44138cae7e8fe0749a7d620cf940204"
                ],
                "1.9.4": [
                    "yarn-v1.9.4.tar.gz",
                    "yarn-v1.9.4",
                    "7667eb715077b4bad8e2a832e7084e0e6f1ba54d7280dc573c8f7031a7fb093e"
                ]
            },
            "yarn_urls": [
                "https://mirror.bazel.build/github.com/yarnpkg/yarn/releases/download/v{version}/{filename}",
                "https://github.com/yarnpkg/yarn/releases/download/v{version}/{filename}"
            ],
            "yarn_version": "1.13.0"
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/node:node_repositories.bzl%_nodejs_repo",
                "output_tree_hash": "f6114da6aef9f70b78789e9cc29558a4077bafa6e43ad6a23d8e476afd140270",
                "attributes": {
                    "name": "nodejs",
                    "node_repositories": {
                        "10.10.0-darwin_amd64": [
                            "node-v10.10.0-darwin-x64.tar.gz",
                            "node-v10.10.0-darwin-x64",
                            "00b7a8426e076e9bf9d12ba2d571312e833fe962c70afafd10ad3682fdeeaa5e"
                        ],
                        "10.10.0-linux_amd64": [
                            "node-v10.10.0-linux-x64.tar.xz",
                            "node-v10.10.0-linux-x64",
                            "686d2c7b7698097e67bcd68edc3d6b5d28d81f62436c7cf9e7779d134ec262a9"
                        ],
                        "10.10.0-windows_amd64": [
                            "node-v10.10.0-win-x64.zip",
                            "node-v10.10.0-win-x64",
                            "70c46e6451798be9d052b700ce5dadccb75cf917f6bf0d6ed54344c856830cfb"
                        ],
                        "10.13.0-darwin_amd64": [
                            "node-v10.13.0-darwin-x64.tar.gz",
                            "node-v10.13.0-darwin-x64",
                            "815a5d18516934a3963ace9f0574f7d41f0c0ce9186a19be3d89e039e57598c5"
                        ],
                        "10.13.0-linux_amd64": [
                            "node-v10.13.0-linux-x64.tar.xz",
                            "node-v10.13.0-linux-x64",
                            "0dc6dba645550b66f8f00541a428c29da7c3cde32fb7eda2eb626a9db3bbf08d"
                        ],
                        "10.13.0-windows_amd64": [
                            "node-v10.13.0-win-x64.zip",
                            "node-v10.13.0-win-x64",
                            "eb09c9e9677f1919ec1ca78623c09b2a718ec5388b72b7662d5c41e5f628a52c"
                        ],
                        "10.3.0-darwin_amd64": [
                            "node-v10.3.0-darwin-x64.tar.gz",
                            "node-v10.3.0-darwin-x64",
                            "0bb5b7e3fe8cccda2abda958d1eb0408f1518a8b0cb58b75ade5d507cd5d6053"
                        ],
                        "10.3.0-linux_amd64": [
                            "node-v10.3.0-linux-x64.tar.xz",
                            "node-v10.3.0-linux-x64",
                            "eb3c3e2585494699716ad3197c8eedf4003d3f110829b30c5a0dc34414c47423"
                        ],
                        "10.3.0-windows_amd64": [
                            "node-v10.3.0-win-x64.zip",
                            "node-v10.3.0-win-x64",
                            "65d586afb087406a2800d8e51f664c88b26d510f077b85a3b177a1bb79f73677"
                        ],
                        "10.9.0-darwin_amd64": [
                            "node-v10.9.0-darwin-x64.tar.gz",
                            "node-v10.9.0-darwin-x64",
                            "3c4fe75dacfcc495a432a7ba2dec9045cff359af2a5d7d0429c84a424ef686fc"
                        ],
                        "10.9.0-linux_amd64": [
                            "node-v10.9.0-linux-x64.tar.xz",
                            "node-v10.9.0-linux-x64",
                            "c5acb8b7055ee0b6ac653dc4e458c5db45348cecc564b388f4ed1def84a329ff"
                        ],
                        "10.9.0-windows_amd64": [
                            "node-v10.9.0-win-x64.zip",
                            "node-v10.9.0-win-x64",
                            "6a75cdbb69d62ed242d6cbf0238a470bcbf628567ee339d4d098a5efcda2401e"
                        ],
                        "8.11.1-darwin_amd64": [
                            "node-v8.11.1-darwin-x64.tar.gz",
                            "node-v8.11.1-darwin-x64",
                            "5c7b05899ff56910a2b8180f139d48612f349ac2c5d20f08dbbeffbed9e3a089"
                        ],
                        "8.11.1-linux_amd64": [
                            "node-v8.11.1-linux-x64.tar.xz",
                            "node-v8.11.1-linux-x64",
                            "6617e245fa0f7fbe0e373e71d543fea878315324ab31dc64b4eba10e42d04c11"
                        ],
                        "8.11.1-windows_amd64": [
                            "node-v8.11.1-win-x64.zip",
                            "node-v8.11.1-win-x64",
                            "7d49b59c2b5d73a14c138e8a215d558a64a5241cd5035d9824f608e7bba097b1"
                        ],
                        "8.12.0-darwin_amd64": [
                            "node-v8.12.0-darwin-x64.tar.gz",
                            "node-v8.12.0-darwin-x64",
                            "ca131b84dfcf2b6f653a6521d31f7a108ad7d83f4d7e781945b2eca8172064aa"
                        ],
                        "8.12.0-linux_amd64": [
                            "node-v8.12.0-linux-x64.tar.xz",
                            "node-v8.12.0-linux-x64",
                            "29a20479cd1e3a03396a4e74a1784ccdd1cf2f96928b56f6ffa4c8dae40c88f2"
                        ],
                        "8.12.0-windows_amd64": [
                            "node-v8.12.0-win-x64.zip",
                            "node-v8.12.0-win-x64",
                            "9b22c9b23148b61ea0052826b3ac0255b8a3a542c125272b8f014f15bf11b091"
                        ],
                        "8.9.1-darwin_amd64": [
                            "node-v8.9.1-darwin-x64.tar.gz",
                            "node-v8.9.1-darwin-x64",
                            "05c992a6621d28d564b92bf3051a5dc0adf83839237c0d4653a8cdb8a1c73b94"
                        ],
                        "8.9.1-linux_amd64": [
                            "node-v8.9.1-linux-x64.tar.xz",
                            "node-v8.9.1-linux-x64",
                            "8be82805f7c1ab3e64d4569fb9a90ded2de78dd27cadbb91bad1bf975dae1e2d"
                        ],
                        "8.9.1-windows_amd64": [
                            "node-v8.9.1-win-x64.zip",
                            "node-v8.9.1-win-x64",
                            "db89c6e041da359561fbe7da075bb4f9881a0f7d3e98c203e83732cfb283fa4a"
                        ],
                        "9.11.1-darwin_amd64": [
                            "node-v9.11.1-darwin-x64.tar.gz",
                            "node-v9.11.1-darwin-x64",
                            "7b1fb394aa41a62b477e36df16644bd383cc9084808511f6cd318b835a06aac6"
                        ],
                        "9.11.1-linux_amd64": [
                            "node-v9.11.1-linux-x64.tar.xz",
                            "node-v9.11.1-linux-x64",
                            "4d27a95d5c2f1c8ef99118794c9c4903e63963418d3e16ca7576760cff39879b"
                        ],
                        "9.11.1-windows_amd64": [
                            "node-v9.11.1-win-x64.zip",
                            "node-v9.11.1-win-x64",
                            "0a3566d57ccb7fed95d18fc6c3bc1552a1b1e4753f9bc6c5d45e04f325e1ee53"
                        ]
                    },
                    "node_urls": [
                        "https://mirror.bazel.build/nodejs.org/dist/v{version}/{filename}",
                        "https://nodejs.org/dist/v{version}/{filename}"
                    ],
                    "node_version": "10.13.0",
                    "package_json": [
                        "//:package.json"
                    ],
                    "preserve_symlinks": True,
                    "yarn_repositories": {
                        "1.12.1": [
                            "yarn-v1.12.1.tar.gz",
                            "yarn-v1.12.1",
                            "09bea8f4ec41e9079fa03093d3b2db7ac5c5331852236d63815f8df42b3ba88d"
                        ],
                        "1.12.3": [
                            "yarn-v1.12.3.tar.gz",
                            "yarn-v1.12.3",
                            "02cd4b589ec22c4bdbd2bc5ebbfd99c5e99b07242ad68a539cb37896b93a24f2"
                        ],
                        "1.13.0": [
                            "yarn-v1.13.0.tar.gz",
                            "yarn-v1.13.0",
                            "125d40ebf621ebb08e3f66a618bd2cc5cd77fa317a312900a1ab4360ed38bf14"
                        ],
                        "1.3.2": [
                            "yarn-v1.3.2.tar.gz",
                            "yarn-v1.3.2",
                            "6cfe82e530ef0837212f13e45c1565ba53f5199eec2527b85ecbcd88bf26821d"
                        ],
                        "1.5.1": [
                            "yarn-v1.5.1.tar.gz",
                            "yarn-v1.5.1",
                            "cd31657232cf48d57fdbff55f38bfa058d2fb4950450bd34af72dac796af4de1"
                        ],
                        "1.6.0": [
                            "yarn-v1.6.0.tar.gz",
                            "yarn-v1.6.0",
                            "a57b2fdb2bfeeb083d45a883bc29af94d5e83a21c25f3fc001c295938e988509"
                        ],
                        "1.9.2": [
                            "yarn-v1.9.2.tar.gz",
                            "yarn-v1.9.2",
                            "3ad69cc7f68159a562c676e21998eb21b44138cae7e8fe0749a7d620cf940204"
                        ],
                        "1.9.4": [
                            "yarn-v1.9.4.tar.gz",
                            "yarn-v1.9.4",
                            "7667eb715077b4bad8e2a832e7084e0e6f1ba54d7280dc573c8f7031a7fb093e"
                        ]
                    },
                    "yarn_urls": [
                        "https://mirror.bazel.build/github.com/yarnpkg/yarn/releases/download/v{version}/{filename}",
                        "https://github.com/yarnpkg/yarn/releases/download/v{version}/{filename}"
                    ],
                    "yarn_version": "1.13.0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
        "definition_information": "Call stack for the definition of repository 'npm' which is a yarn_install (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/npm_install/npm_install.bzl:382:16):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/defs.bzl:82:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:168:1",
        "original_attributes": {
            "name": "npm",
            "package_json": "//:package.json",
            "yarn_lock": "//:yarn.lock"
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/npm_install:npm_install.bzl%yarn_install",
                "output_tree_hash": "b1b0272419adb6bdc1a18918f80bf7570804eb943f4e01901d5ce9f02f8dc768",
                "attributes": {
                    "name": "npm",
                    "package_json": "//:package.json",
                    "yarn_lock": "//:yarn.lock"
                }
            }
        ]
    },
    {
        "original_rule_class": "@build_bazel_rules_nodejs//internal/node:node_repositories.bzl%_yarn_repo",
        "definition_information": "Call stack for the definition of repository 'yarn' which is a _yarn_repo (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:477:14):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:627:9\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/build_bazel_rules_nodejs/internal/node/node_repositories.bzl:585:5\n - /usr/local/google/home/salikh/go/src/github.com/salikh/processingjs-ide/WORKSPACE:165:1",
        "original_attributes": {
            "name": "yarn",
            "package_json": [
                "//:package.json"
            ]
        },
        "repositories": [
            {
                "rule_class": "@build_bazel_rules_nodejs//internal/node:node_repositories.bzl%_yarn_repo",
                "output_tree_hash": "c065f063e3f4bef34067226a2eb9aedb618aaa293633112584eca81661a95aa5",
                "attributes": {
                    "name": "yarn",
                    "package_json": [
                        "//:package.json"
                    ]
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_coverage_tools' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:5:1",
        "original_attributes": {
            "name": "remote_coverage_tools",
            "urls": [
                "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v1.0.zip"
            ],
            "sha256": "cc470e529fafb6165b5be3929ff2d99b38429b386ac100878687416603a67889"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "8a2bd5f6d7b633d736d771e1c21a3223559d9adaa35207d76b1d2b53032bdc57",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v1.0.zip"
                    ],
                    "sha256": "cc470e529fafb6165b5be3929ff2d99b38429b386ac100878687416603a67889",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_coverage_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "bootclasspath",
            "actual": "@local_jdk//:bootclasspath"
        },
        "native": "bind(name = \"bootclasspath\", actual = \"@local_jdk//:bootclasspath\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extclasspath",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extclasspath\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extdir",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extdir\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jar",
            "actual": "@local_jdk//:jar"
        },
        "native": "bind(name = \"jar\", actual = \"@local_jdk//:jar\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "java",
            "actual": "@local_jdk//:java"
        },
        "native": "bind(name = \"java\", actual = \"@local_jdk//:java\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "javac",
            "actual": "@local_jdk//:javac"
        },
        "native": "bind(name = \"javac\", actual = \"@local_jdk//:javac\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk-default",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk-default\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_header",
            "actual": "@local_jdk//:jni_header"
        },
        "native": "bind(name = \"jni_header\", actual = \"@local_jdk//:jni_header\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-darwin",
            "actual": "@local_jdk//:jni_md_header-darwin"
        },
        "native": "bind(name = \"jni_md_header-darwin\", actual = \"@local_jdk//:jni_md_header-darwin\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-freebsd",
            "actual": "@local_jdk//:jni_md_header-freebsd"
        },
        "native": "bind(name = \"jni_md_header-freebsd\", actual = \"@local_jdk//:jni_md_header-freebsd\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-linux",
            "actual": "@local_jdk//:jni_md_header-linux"
        },
        "native": "bind(name = \"jni_md_header-linux\", actual = \"@local_jdk//:jni_md_header-linux\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre-default",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre-default\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "new_local_repository",
        "original_attributes": {
            "name": "local_jdk",
            "path": "/usr/local/buildtools/java/jdk8-google-v7-64",
            "build_file": "/usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/install/39bc573845b7004b30b12e1a70ed57b7/_embedded_binaries/jdk.BUILD"
        },
        "native": "new_local_repository(name = \"local_jdk\", path = \"/usr/local/buildtools/java/jdk8-google-v7-64\", build_file = __embedded_dir__ + \"/\" + \"jdk.BUILD\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_darwin' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:245:1",
        "original_attributes": {
            "name": "remote_java_tools_darwin",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_darwin-v2.0.zip"
            ],
            "sha256": "0ceb0c9ff91256fe33508306bc9cd9e188dcca38df78e70839d426bdaef67a38"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "6e401be95c764ebb19c9cc15e21631ba4596132ad3f9a171a851078bef86423e",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_darwin-v2.0.zip"
                    ],
                    "sha256": "0ceb0c9ff91256fe33508306bc9cd9e188dcca38df78e70839d426bdaef67a38",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_darwin"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_linux' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:229:1",
        "original_attributes": {
            "name": "remote_java_tools_linux",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_linux-v2.0.zip"
            ],
            "sha256": "074d624fb34441df369afdfd454e75dba821d5d54932fcfee5ba598d17dc1b99"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "5a0bf7da6f4240b1590103a667ee58be4ab3b2514a2784f5d96cc61fdfe37f1c",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_linux-v2.0.zip"
                    ],
                    "sha256": "074d624fb34441df369afdfd454e75dba821d5d54932fcfee5ba598d17dc1b99",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_windows' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:237:1",
        "original_attributes": {
            "name": "remote_java_tools_windows",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_windows-v2.0.zip"
            ],
            "sha256": "2c3fc0ce7d30d60e26f4b8a36e2eadcf9e6a9d5a51b667d3d13b78db53b24251"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "8d1072bc57b27b6b59bacecce338dc1517aa3b1dcf99a991f233ad1e3a7c6466",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_windows-v2.0.zip"
                    ],
                    "sha256": "2c3fc0ce7d30d60e26f4b8a36e2eadcf9e6a9d5a51b667d3d13b78db53b24251",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_windows"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:155:1",
        "original_attributes": {
            "name": "remotejdk10_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "68635cf0b631d86eb488acc5e8d11f9b8e52cb48c0a920a62164957390c95b1b",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux_aarch64' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:187:1",
        "original_attributes": {
            "name": "remotejdk10_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
            ],
            "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
            "strip_prefix": "jdk10-server-release-1804",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "eed5745d9b44725b2386e9f4d4bf23bbd96776a686f5a4f9f0283dba700c122b",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
                    ],
                    "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
                    "canonical_id": "",
                    "strip_prefix": "jdk10-server-release-1804",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_macos' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:165:1",
        "original_attributes": {
            "name": "remotejdk10_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "c8e0533fa1387f0a000b13417a55228d1afb212141c8aa88ac2e9399c8c0af95",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_win' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:175:1",
        "original_attributes": {
            "name": "remotejdk10_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
            ],
            "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "39a4c3f755408b8d841ec5e26fff79d967cb346711931c80aca34ffb401268cd",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
                    ],
                    "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_linux' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:199:1",
        "original_attributes": {
            "name": "remotejdk11_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
            ],
            "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "a69b51daa38e36a8df50b38c457bed7a891e265be553e9addd9cf68ba20e3199",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
                    ],
                    "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_macos' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:209:1",
        "original_attributes": {
            "name": "remotejdk11_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
            ],
            "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "dbdcb740e805dc00c08b52d33c5365f4619c662f22b3407f3ac46fb92b23564c",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
                    ],
                    "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_win' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:219:1",
        "original_attributes": {
            "name": "remotejdk11_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
            ],
            "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "0e0f669f2d143b2b16a406e7c7de8557048103b144a5def76c54f7e368403fe5",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
                    ],
                    "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:111:1",
        "original_attributes": {
            "name": "remotejdk_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "84ecda96d9caa3283708639e4c694503a1008384bef3490f1183a7859531b032",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux_aarch64' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:143:1",
        "original_attributes": {
            "name": "remotejdk_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
            ],
            "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
            "strip_prefix": "jdk9-server-release-1708",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "9619a6b9fa84ee04ccd6f2200eea2d846ca7d050cef351fa7db9d84d3f500bb4",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
                    ],
                    "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
                    "canonical_id": "",
                    "strip_prefix": "jdk9-server-release-1708",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_macos' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:121:1",
        "original_attributes": {
            "name": "remotejdk_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "863f85a41b9a42a743939c525ea03c9480977d0f0f6d964267f3e1e8f60c6248",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_win' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:131:1",
        "original_attributes": {
            "name": "remotejdk_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
            ],
            "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "914538371f6117c0a1acd5057afcdc22e33dfacedaaca6e4f0d15d7d61e20499",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
                    ],
                    "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'android_tools' which is a http_archive (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:267:1",
        "original_attributes": {
            "name": "android_tools",
            "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.4.tar.gz",
            "sha256": "331e7706f2bcae8a68057d8ddd3e3f1574bca26c67c65802fc4a8ac6164fa912"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "53d05d7480b16311a481ad07a6c8114b8c8a6646016a1217e10fb3ca279bfb92",
                "attributes": {
                    "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.4.tar.gz",
                    "urls": [],
                    "sha256": "331e7706f2bcae8a68057d8ddd3e3f1574bca26c67c65802fc4a8ac6164fa912",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "android_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_cc' which is a cc_autoconf (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/cpp/cc_configure.bzl:121:15):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/cpp/cc_configure.bzl:162:5\n - /DEFAULT.WORKSPACE.SUFFIX:293:1",
        "original_attributes": {
            "name": "local_config_cc"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
                "output_tree_hash": "f57816b14f1e72225d1992b6ad7a20c9b256d1568bb893d747b37d744d6a44e8",
                "attributes": {
                    "name": "local_config_cc"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
        "definition_information": "Call stack for the definition of repository 'local_config_cc_toolchains' which is a cc_autoconf_toolchains (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/cpp/cc_configure.bzl:79:26):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/cpp/cc_configure.bzl:161:5\n - /DEFAULT.WORKSPACE.SUFFIX:293:1",
        "original_attributes": {
            "name": "local_config_cc_toolchains"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
                "output_tree_hash": "b49ed07ecd31233cf835f6d7c50619050854cc5f1a25d775c6cd85412f90876a",
                "attributes": {
                    "name": "local_config_cc_toolchains"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_xcode' which is a xcode_autoconf (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/osx/xcode_configure.bzl:242:18):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/osx/xcode_configure.bzl:252:5\n - /DEFAULT.WORKSPACE.SUFFIX:296:1",
        "original_attributes": {
            "name": "local_config_xcode",
            "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
                "output_tree_hash": "ec026961157bb71cf68d1b568815ad68147ed16f318161bc0da40f6f3d7d79fd",
                "attributes": {
                    "name": "local_config_xcode",
                    "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
        "definition_information": "Call stack for the definition of repository 'local_config_sh' which is a sh_config (rule definition at /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/sh/sh_configure.bzl:72:13):\n - /usr/local/google/home/salikh/.cache/bazel/_bazel_salikh/7e8d63ca448cb526abde53ea9d87981e/external/bazel_tools/tools/sh/sh_configure.bzl:83:5\n - /DEFAULT.WORKSPACE.SUFFIX:299:1",
        "original_attributes": {
            "name": "local_config_sh"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
                "output_tree_hash": "e36855460b514225eac75f4abe2cb992c5455b7077a9028d213d269d11490744",
                "attributes": {
                    "name": "local_config_sh"
                }
            }
        ]
    },
    {
        "original_rule_class": "register_toolchains",
        "original_attributes": {
            "name": "//external/toolchains",
            "*args": [
                "@go_sdk//:go_android_386",
                "@go_sdk//:go_android_amd64",
                "@go_sdk//:go_android_arm",
                "@go_sdk//:go_android_arm64",
                "@go_sdk//:go_darwin_386",
                "@go_sdk//:go_darwin_amd64",
                "@go_sdk//:go_darwin_arm",
                "@go_sdk//:go_darwin_arm64",
                "@go_sdk//:go_dragonfly_amd64",
                "@go_sdk//:go_freebsd_386",
                "@go_sdk//:go_freebsd_amd64",
                "@go_sdk//:go_freebsd_arm",
                "@go_sdk//:go_linux_386",
                "@go_sdk//:go_linux_amd64",
                "@go_sdk//:go_linux_arm",
                "@go_sdk//:go_linux_arm64",
                "@go_sdk//:go_linux_mips",
                "@go_sdk//:go_linux_mips64",
                "@go_sdk//:go_linux_mips64le",
                "@go_sdk//:go_linux_mipsle",
                "@go_sdk//:go_linux_ppc64",
                "@go_sdk//:go_linux_ppc64le",
                "@go_sdk//:go_linux_s390x",
                "@go_sdk//:go_nacl_386",
                "@go_sdk//:go_nacl_amd64p32",
                "@go_sdk//:go_nacl_arm",
                "@go_sdk//:go_netbsd_386",
                "@go_sdk//:go_netbsd_amd64",
                "@go_sdk//:go_netbsd_arm",
                "@go_sdk//:go_openbsd_386",
                "@go_sdk//:go_openbsd_amd64",
                "@go_sdk//:go_openbsd_arm",
                "@go_sdk//:go_plan9_386",
                "@go_sdk//:go_plan9_amd64",
                "@go_sdk//:go_plan9_arm",
                "@go_sdk//:go_solaris_amd64",
                "@go_sdk//:go_windows_386",
                "@go_sdk//:go_windows_amd64",
                "@go_sdk//:go_js_wasm",
                "@bazel_tools//tools/jdk:all",
                "@bazel_tools//tools/python:autodetecting_toolchain",
                "@local_config_cc_toolchains//:all",
                "@local_config_sh//:local_sh_toolchain"
            ]
        },
        "native": "register_toolchains(\"@go_sdk//:go_android_386\", \"@go_sdk//:go_android_amd64\", \"@go_sdk//:go_android_arm\", \"@go_sdk//:go_android_arm64\", \"@go_sdk//:go_darwin_386\", \"@go_sdk//:go_darwin_amd64\", \"@go_sdk//:go_darwin_arm\", \"@go_sdk//:go_darwin_arm64\", \"@go_sdk//:go_dragonfly_amd64\", \"@go_sdk//:go_freebsd_386\", \"@go_sdk//:go_freebsd_amd64\", \"@go_sdk//:go_freebsd_arm\", \"@go_sdk//:go_linux_386\", \"@go_sdk//:go_linux_amd64\", \"@go_sdk//:go_linux_arm\", \"@go_sdk//:go_linux_arm64\", \"@go_sdk//:go_linux_mips\", \"@go_sdk//:go_linux_mips64\", \"@go_sdk//:go_linux_mips64le\", \"@go_sdk//:go_linux_mipsle\", \"@go_sdk//:go_linux_ppc64\", \"@go_sdk//:go_linux_ppc64le\", \"@go_sdk//:go_linux_s390x\", \"@go_sdk//:go_nacl_386\", \"@go_sdk//:go_nacl_amd64p32\", \"@go_sdk//:go_nacl_arm\", \"@go_sdk//:go_netbsd_386\", \"@go_sdk//:go_netbsd_amd64\", \"@go_sdk//:go_netbsd_arm\", \"@go_sdk//:go_openbsd_386\", \"@go_sdk//:go_openbsd_amd64\", \"@go_sdk//:go_openbsd_arm\", \"@go_sdk//:go_plan9_386\", \"@go_sdk//:go_plan9_amd64\", \"@go_sdk//:go_plan9_arm\", \"@go_sdk//:go_solaris_amd64\", \"@go_sdk//:go_windows_386\", \"@go_sdk//:go_windows_amd64\", \"@go_sdk//:go_js_wasm\", \"@bazel_tools//tools/jdk:all\", \"@bazel_tools//tools/python:autodetecting_toolchain\", \"@local_config_cc_toolchains//:all\", \"@local_config_sh//:local_sh_toolchain\")"
    }
]