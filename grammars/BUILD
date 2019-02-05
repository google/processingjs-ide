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
