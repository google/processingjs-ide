load("@org_pubref_rules_node//node:rules.bzl", "node_module")

def pegjs_grammar(name, srcs, varname,
                  visibility=["//visibility:private"],
                  startrules=[]):
  outjs = [src+".js" for src in srcs]
  native.genrule(
    name = name + '_genrule',
    srcs = srcs,
    outs = outjs,
    cmd = ("$(location @yarn_modules//:node_modules/pegjs/bin/pegjs) " +
         "--format globals " +
         ("--allowed-start-rules " + ",".join(startrules) + " "
          if len(startrules) > 0 else "") +
         "--export-var " + varname + " -o $@ $<"),
    tools = [
      "@yarn_modules//:node_modules/pegjs/bin/pegjs",
    ],
    visibility = visibility,
  )
  node_module(
    name = name,
    main = outjs[0],
    srcs = outjs,
    version = "0.0.1",
    description = "Synthetic node module for " + name,
    deps = [
      "@yarn_modules//:_all_",
    ],
    visibility = visibility,
  )
    

