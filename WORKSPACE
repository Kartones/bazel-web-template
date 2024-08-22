workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Dependency for rules_js
http_archive(
    name = "bazel_features",
    sha256 = "ba1282c1aa1d1fffdcf994ab32131d7c7551a9bc960fbf05f42d55a1b930cbfb",
    strip_prefix = "bazel_features-1.15.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.15.0/bazel_features-v1.15.0.tar.gz",
)

# Common utils
http_archive(
    name = "bazel_skylib",
    sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
    ],
)

# Must-have for building macros & rules
http_archive(
    name = "aspect_bazel_lib",
    sha256 = "688354ee6beeba7194243d73eb0992b9a12e8edeeeec5b6544f4b531a3112237",
    strip_prefix = "bazel-lib-2.8.1",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.8.1/bazel-lib-v2.8.1.tar.gz",
)

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "87c6171c5be7b69538d4695d9ded29ae2626c5ed76a9adeedce37b63c73bef67",
    strip_prefix = "rules_nodejs-6.2.0",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.2.0/rules_nodejs-v6.2.0.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "4cab6898f0ff8048e32640cce06a47aa4b92b2fb330d055940f95f24c8ebb868",
    strip_prefix = "rules_js-2.0.1",
    url = "https://github.com/aspect-build/rules_js/releases/download/v2.0.1/rules_js-v2.0.1.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "ee7dcc35faef98f3050df9cf26f2a72ef356cab8ad927efb1c4dc119ac082a19",
    strip_prefix = "rules_ts-3.0.0",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v3.0.0/rules_ts-v3.0.0.tar.gz",
)

# ------------------------

load("@bazel_features//:deps.bzl", "bazel_features_deps")
bazel_features_deps()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies", "aspect_bazel_lib_register_toolchains")
aspect_bazel_lib_dependencies()
aspect_bazel_lib_register_toolchains()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")
rules_js_dependencies()

# NodeJS version dependant on rules_nodejs
# https://github.com/bazelbuild/rules_nodejs/releases/latest -> nodejs/private/node_versions.bzl
# check always latest version *released*
load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")
nodejs_register_toolchains(
    name = "nodejs",
    # Also defined at package.json
    node_version_from_nvmrc = "//:.nvmrc",
)

# pnpm version dependant on rules_js
# https://github.com/aspect-build/rules_js/releases/latest -> npm/private/versions.bzl
load("@aspect_rules_js//npm:repositories.bzl", "npm_translate_lock")
npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    npmrc = "//:.npmrc",
    verify_node_modules_ignored = "//:.bazelignore",
    # Also defined at package.json
    pnpm_version = "9.7.0",
)

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

# TypeScript version dependant on rules_ts
# https://github.com/aspect-build/rules_ts/releases/latest -> ts/private/versions.bzl
# check always latest version *released*
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")
rules_ts_dependencies(ts_version_from = "//:package.json")
