load(
  "@aspect_rules_ts//ts:defs.bzl",
  _ts_config = "ts_config",
  _ts_project = "ts_project"
)
load("//rules:constants.bzl", "TAG_TYPESCRIPT")

def ts_config(name, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(TAG_TYPESCRIPT)
    _ts_config(
      name = name,
      tags = tags,
      **kwargs,
    )

def ts_project(name, tsconfig, **kwargs):
    tags = kwargs.pop("tags", [])
    tags.append(TAG_TYPESCRIPT)
    _ts_project(
      name = name,
      tags = tags,
      tsconfig = tsconfig,
      out_dir = ".",
      # https://docs.aspect.build/rulesets/aspect_rules_ts/docs/transpiler/
      # SWC is faster, but we can live with slower speed and 100% accuracy
      transpiler = "tsc",
      source_map = True,
      resolve_json_module = True,
      incremental = True,
      declaration = True,
      declaration_map = True,
      allow_js = True,
      **kwargs,
    )
