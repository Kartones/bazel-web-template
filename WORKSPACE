workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Dependency for rules_js
http_archive(
    name = "bazel_features",
    sha256 = "3646ffd447753490b77d2380fa63f4d55dd9722e565d84dfda01536b48e183da",
    strip_prefix = "bazel_features-1.19.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.19.0/bazel_features-v1.19.0.tar.gz",
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
    sha256 = "f93d386d8d0b0149031175e81df42a488be4267c3ca2249ba5321c23c60bc1f0",
    strip_prefix = "bazel-lib-2.9.1",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.9.1/bazel-lib-v2.9.1.tar.gz",
)

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "83d2bb029c2a9a06a474c8748d1221a92a7ca02222dcf49a0b567825c4e3f1ce",
    strip_prefix = "rules_nodejs-6.3.0",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.3.0/rules_nodejs-v6.3.0.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "91655ebd3178f979fcacd018f8f42aa9d3bc79c4fbddb7be9521971ec77e6aee",
    strip_prefix = "rules_js-2.0.2",
    url = "https://github.com/aspect-build/rules_js/releases/download/v2.0.2/rules_js-v2.0.2.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "d23ba2b800493a83c3ec9e300e01c74a7b0a58c08893e681417e2c2f48f8c4bb",
    strip_prefix = "rules_ts-3.2.0",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v3.2.0/rules_ts-v3.2.0.tar.gz",
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
    pnpm_version = "9.7.1",
)

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

# TypeScript version dependant on rules_ts
# https://github.com/aspect-build/rules_ts/releases/latest -> ts/private/versions.bzl
# check always latest version *released*
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")
rules_ts_dependencies(ts_version_from = "//:package.json")
