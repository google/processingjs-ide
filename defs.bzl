load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_test")

def mocha_test(name, data = [], src = None, **kwargs):
    """Runs mocha test."""
    if native.package_name():
        srcpath = native.package_name() + "/" + src
    else:
        srcpath = src
    args = [
        srcpath,
    ]

    nodejs_test(
        name = name,
        data = data + [
            "@npm//mocha",
            "@npm//chai",
            "@npm//chai-match",
            src,
        ],
        entry_point = "npm/node_modules/mocha/bin/mocha",
        templated_args = args,
        expected_exit_code = 0,
        **kwargs
    )
