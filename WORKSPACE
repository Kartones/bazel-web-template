workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Dependency for rules_js
http_archive(
    name = "bazel_features",
    sha256 = "af3d4fb1cf4f25942cb4a933b1ad93a0ea9fe9ee70c2af7f369fb72a67c266e5",
    strip_prefix = "bazel_features-1.21.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.21.0/bazel_features-v1.21.0.tar.gz",
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
    sha256 = "349aabd3c2b96caeda6181eb0ae1f14f2a1d9f3cd3c8b05d57f709ceb12e9fb3",
    strip_prefix = "bazel-lib-2.9.4",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.9.4/bazel-lib-v2.9.4.tar.gz",
)

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "158619723f1d8bd535dd6b93521f4e03cf24a5e107126d05685fbd9540ccad10",
    strip_prefix = "rules_nodejs-6.3.2",
    url = "https://github.com/bazel-contrib/rules_nodejs/releases/download/v6.3.2/rules_nodejs-v6.3.2.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "75c25a0f15a9e4592bbda45b57aa089e4bf17f9176fd735351e8c6444df87b52",
    strip_prefix = "rules_js-2.1.0",
    url = "https://github.com/aspect-build/rules_js/releases/download/v2.1.0/rules_js-v2.1.0.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "9acd128abe77397505148eaa6895faed57839560dbf2177dd6285e51235e2724",
    strip_prefix = "rules_ts-3.3.1",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v3.3.1/rules_ts-v3.3.1.tar.gz",
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
# check always latest version *released*
# Note: pnpm lockfile v9 not yet supported
load("@aspect_rules_js//npm:repositories.bzl", "npm_translate_lock")
npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    npmrc = "//:.npmrc",
    verify_node_modules_ignored = "//:.bazelignore",
    # Also defined at package.json
    pnpm_version = "9.12.1",
)

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

# TypeScript version dependant on rules_ts
# https://github.com/aspect-build/rules_ts/releases/latest -> ts/private/versions.bzl
# check always latest version *released*
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")
rules_ts_dependencies(ts_version_from = "//:package.json")
