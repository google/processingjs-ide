load("//grammars:pegjs.bzl", "pegjs_grammar")

pegjs_grammar(
    name = "toplevel",
    srcs = ["toplevel.pegjs"],
    startrules = [
        "Source",
        "StrictSource",
        "Decl",
        "ClassBody",
        "ClassDecl",
        "VarDecl",
        "Statement",
        "Term",
        "QualifiedName",
        "Expression",
        "ArrayInitializer",
        "VariableDeclarators",
        "ClassBodyDecl",
        "MethodDecl",
        "FormalParameters",
        "Creator",
        "CreatedName",
        "ClassCreatorRest",
        "op",
        "Block",
    ],
    varname = "toplevelGrammar",
    visibility = ["//visibility:public"],
)

load("@org_pubref_rules_node//node:rules.bzl", "mocha_test", "node_module")

mocha_test(
    name = "toplevel_test",
    main = "toplevel_test.js",
    deps = [
        ":examples",
        ":toplevel",
        "@yarn_modules//:_all_",
    ],
)

node_module(
    name = "examples",
    srcs = glob(["examples/*"]),
    description = "Dummy module to provide examples as node module.",
    version = "0.0.0",
)

exports_files(["toplevel-externs.js"])
