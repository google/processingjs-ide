def pegjs_grammar(name, srcs, varname):
  native.genrule(
    name=name,
    srcs=srcs,
    outs=[src.replace("\\.pegjs", "")+".js" for src in srcs],
    cmd=("$(location @yarn_modules//:node_modules/pegjs/bin/pegjs) " +
	 "--format globals --export-var " + varname + " -o $@ $<"),
    tools = [
      "@yarn_modules//:node_modules/pegjs/bin/pegjs",
    ],
  )
  # TODO(salikh): Declare a js_library using the generated .js source.
    

