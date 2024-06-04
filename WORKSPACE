workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "3e8369256ad63197959d2253c473a9dcc57c2841d176190e59b91d25d4fe9e67",
    strip_prefix = "rules_nodejs-6.1.1",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.1.1/rules_nodejs-v6.1.1.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "2cfb3875e1231cefd3fada6774f2c0c5a99db0070e0e48ea398acbff7c6c765b",
    strip_prefix = "rules_js-1.42.3",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.42.3/rules_js-v1.42.3.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "f69a6452b129d39d9b05f3dff8b1057185bb195b4daf0cff419988de757c6c31",
    strip_prefix = "rules_ts-2.4.2",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v2.4.2/rules_ts-v2.4.2.tar.gz",
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
    sha256 = "6d758a8f646ecee7a3e294fbe4386daafbe0e5966723009c290d493f227c390b",
    strip_prefix = "bazel-lib-2.7.7",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.7.7/bazel-lib-v2.7.7.tar.gz",
)

# ------------------------

# pnpm version dependant on rules_js
# https://github.com/aspect-build/rules_js/releases/latest -> npm/private/versions.bzl
load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")
rules_js_dependencies()

# TypeScript version dependant on rules_ts
# https://github.com/aspect-build/rules_ts/releases/latest -> ts/private/versions.bzl
# check always latest version *released*
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")
rules_ts_dependencies(ts_version_from = "//:package.json")

load("@bazel_features//:deps.bzl", "bazel_features_deps")
bazel_features_deps()

# NodeJS version dependant on rules_nodejs
# https://github.com/bazelbuild/rules_nodejs/releases/latest -> nodejs/private/node_versions.bzl
# check always latest version *released*
load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")
nodejs_register_toolchains(
    name = "nodejs",
    node_version_from_nvmrc = "//:.nvmrc",
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")
npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    npmrc = "//:.npmrc",
    verify_node_modules_ignored = "//:.bazelignore",
    pnpm_version = "8.15.3",
)

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies", "aspect_bazel_lib_register_toolchains")
aspect_bazel_lib_dependencies()
aspect_bazel_lib_register_toolchains()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()
