load("//grammars:pegjs.bzl", "pegjs_grammar")

pegjs_grammar(
    name = "toplevel",
    varname = "toplevelGrammar",
    srcs = ["toplevel.pegjs"],
    visibility = ["//visibility:public"],
    startrules = ["Source", "StrictSource", "Decl", "ClassBody", "ClassDecl", "VarDecl", "Statement", "Term", "QualifiedName", "Expression", "ArrayInitializer", "VariableDeclarators", "ClassBodyDecl", "MethodDecl", "FormalParameters", "Creator", "CreatedName", "ClassCreatorRest", "op", "Block"],
)

load("@org_pubref_rules_node//node:rules.bzl", "mocha_test", "node_module")

mocha_test(
    name = "toplevel_test",
    main = "toplevel_test.js",
    deps = [
      "@yarn_modules//:_all_",
      ":toplevel",
      ":examples",
    ],
)

node_module(
    name = "examples",
    srcs = glob(['examples/*']),
    version = "0.0.0",
    description = "Dummy module to provide examples as node module.",
)

exports_files(["toplevel-externs.js"])
