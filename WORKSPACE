workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "f36e4a4747210331767033dc30728ae3df0856e88ecfdc48a0077ba874db16c3",
    strip_prefix = "rules_nodejs-6.0.3",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.0.3/rules_nodejs-v6.0.3.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "a2f941e27f02e84521c2d47fd530c66d57dd6d6e44b4a4f1496fe304851d8e48",
    strip_prefix = "rules_js-1.35.0",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.35.0/rules_js-v1.35.0.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "bd3e7b17e677d2b8ba1bac3862f0f238ab16edb3e43fb0f0b9308649ea58a2ad",
    strip_prefix = "rules_ts-2.1.0",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v2.1.0/rules_ts-v2.1.0.tar.gz",
)

# Common utils
http_archive(
    name = "bazel_skylib",
    sha256 = "cd55a062e763b9349921f0f5db8c3933288dc8ba4f76dd9416aac68acee3cb94",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.5.0/bazel-skylib-1.5.0.tar.gz",
    ],
)

# Must-have for building macros & rules
http_archive(
    name = "aspect_bazel_lib",
    sha256 = "bda4a69fa50411b5feef473b423719d88992514d259dadba7d8218a1d02c7883",
    strip_prefix = "bazel-lib-2.3.0",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.3.0/bazel-lib-v2.3.0.tar.gz",
)

# ------------------------

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")
rules_js_dependencies()

load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")
rules_ts_dependencies(ts_version_from = "//:package.json")

# DEFAULT_NODE_VERSION is defined at:
# https://github.com/bazelbuild/rules_nodejs/blob/00f8569f3c148c35fec2edb73dc3998d2da25db7/nodejs/repositories.bzl#L12-L21
load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")
nodejs_register_toolchains(
    name = "nodejs",
    node_version = "20.8.0",
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")
npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    npmrc = "//:.npmrc",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@npm//:repositories.bzl", "npm_repositories")
npm_repositories()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies", "aspect_bazel_lib_register_toolchains")
aspect_bazel_lib_dependencies()
aspect_bazel_lib_register_toolchains()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()