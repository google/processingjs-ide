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
        "VarDeclaration",
        "Statement",
        "BlockStatement",
        "Term",
        "TypeDeclaration",
        "term",
        "QualifiedName",
        "Expression",
        "expression",
        "ArrayInitializer",
        "VariableDeclarators",
        "VariableDeclarator",
        "variableDeclarator",
        "VariableInitializer",
        "ClassBodyDecl",
        "MethodDecl",
        "FormalParameters",
        "Creator",
        "CreatedName",
        "ClassCreatorRest",
        "op",
        "Block",
        "literal",
        "exprRest",
        "character",
        "string",
    ],
    varname = "toplevelGrammar",
    visibility = ["//visibility:public"],
)

load("//:defs.bzl", "mocha_test")

mocha_test(
    name = "toplevel_test",
    src = "toplevel_test.js",
    data = [
        ":examples",
        ":toplevel",
    ],
)

filegroup(
    name = "examples",
    srcs = glob(["examples/*"]),
)

exports_files(["toplevel-externs.js"])

load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")
nodejs_binary(
    name = "try_parse",
    data = [
        "try_parse.js",
        ":toplevel",
        "@npm//google-closure-library",
    ],
    entry_point = "__main__/grammars/try_parse.js",
    templated_args = [],
)
