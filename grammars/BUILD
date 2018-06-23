load("//grammars:pegjs.bzl", "pegjs_grammar")

pegjs_grammar(
    name = "toplevel",
    varname = "toplevelGrammar",
    srcs = ["toplevel.pegjs"],
)

# TODO(salikh): Replace the manually generated output with a automatic output
# from pegjs_grammar rule.
exports_files(["toplevel.js"])
