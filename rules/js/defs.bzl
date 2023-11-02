load(
  "@aspect_rules_js//js:defs.bzl",
  _js_binary = "js_binary",
  _js_library = "js_library",
  _js_run_binary = "js_run_binary",
  _js_test = "js_test"
)
load("//rules:constants.bzl", "JAVASCRIPT_TAG")

def js_binary(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(JAVASCRIPT_TAG)
    _js_binary(
      name = name,
      tags = tags,
      **kwargs,
    )

def js_library(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(JAVASCRIPT_TAG)
    _js_library(
      name = name,
      tags = tags,
      **kwargs,
    )

def js_run_binary(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(JAVASCRIPT_TAG)
    _js_run_binary(
      name = name,
      tags = tags,
      **kwargs,
    )

def js_test(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(JAVASCRIPT_TAG)
    _js_test(
      name = name,
      tags = tags,
      **kwargs,
    )
