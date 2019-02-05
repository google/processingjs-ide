def pegjs_grammar(
        name,
        srcs,
        varname,
        visibility = ["//visibility:private"],
        startrules = [],
        format = "globals"):
    outjs = [src + ".js" for src in srcs]
    native.genrule(
        name = name + "_genrule",
        srcs = srcs,
        outs = outjs,
        cmd = ("$(location @npm//pegjs/bin:pegjs) " +
               "--format " + format + " " +
               ("--allowed-start-rules " + ",".join(startrules) + " " if len(startrules) > 0 else "") +
               "--export-var " + varname + " -o $@ $<"),
        tools = [
            "@npm//pegjs/bin:pegjs",
        ],
        visibility = visibility,
    )
    native.filegroup(
        name = name,
        srcs = outjs,
        visibility = visibility,
    )
