load("@aspect_rules_ts//ts:defs.bzl", _ts_config = "ts_config", _ts_project = "ts_project")
load("//rules:constants.bzl", "TYPESCRIPT_TAG")

def ts_config(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(TYPESCRIPT_TAG)
    _ts_config(
      name = name,
      tags = tags,
      **kwargs,
    )

def ts_project(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(TYPESCRIPT_TAG)
    _ts_project(
      name = name,
      tags = tags,
      source_map = True,
      resolve_json_module = True,
      incremental = True,
      declaration = True,
      allow_js = True,
      **kwargs,
    )
