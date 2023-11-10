workspace(
    name = "bazel_web_template",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Base for JS
http_archive(
    name = "rules_nodejs",
    sha256 = "162f4adfd719ba42b8a6f16030a20f434dc110c65dc608660ef7b3411c9873f9",
    strip_prefix = "rules_nodejs-6.0.2",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/v6.0.2/rules_nodejs-v6.0.2.tar.gz",
)

# Must-have for JS
http_archive(
    name = "aspect_rules_js",
    sha256 = "295a73d963bad4b04a3c488d60dc8a76a659ee64708be3a66be75726e6277c7e",
    strip_prefix = "rules_js-1.33.3",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.33.3/rules_js-v1.33.3.tar.gz",
)

# Must-have for TS
http_archive(
    name = "aspect_rules_ts",
    sha256 = "0f43d06b02895f825ac18a60901e899d91b22a11d44c4008c8383ada6096a4a9",
    strip_prefix = "rules_ts-2.0.1",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v2.0.1/rules_ts-v2.0.1.tar.gz",
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
    sha256 = "ce259cbac2e94a6dff01aff9455dcc844c8af141503b02a09c2642695b7b873e",
    strip_prefix = "bazel-lib-1.37.0",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v1.37.0/bazel-lib-v1.37.0.tar.gz",
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

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies")
aspect_bazel_lib_dependencies()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()