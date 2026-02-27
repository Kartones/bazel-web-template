# bazel-web-template

## Setup

- [Bazelisk](https://github.com/bazelbuild/bazelisk), instead of directly using [Bazel](https://github.com/bazelbuild/bazel). Note that it adds a symlink from `bazelisk` to `bazel`.

## Run

To invoke all example runnable targets:

```bash
make run
```

## Development

To build:

`bazel build //...`

Note that `run` and `test` also build/rebuild whatever is needed.

### Rule wrappers

Most external rules are wrapped at `rules` folder, so they can be modified, refactored or simplified at will.

If an external rule is only used inside other rules/macros and not from `BUILD` files, initially there's no need of wrapping them.

### Setup

Each time dependencies change/get updated, run `pnpm install` (toolchains use `pnpm-lock.yaml`).

**Note**: The NodeJS, Typescript and PNPM maximum versions you should use are dictated by [rules_js](https://github.com/aspect-build/rules_js) and [rules_ts](https://github.com/aspect-build/rules_ts). You can see more details, and where to check which versions are available, if you inspect the `MODULE.bazel` file, I left some comments there.

#### Development Requirements

- [nodejs](https://nodejs.org)
- [npm](https://www.npmjs.com)
- [pnpm](https://pnpm.io)
- [typescript](https://www.typescriptlang.org/)

Note: `package.json` maximum versions are mandated from the toolchains. Check the [WORKSPACE](WORKSPACE) file for more details.

For `pnpm`, alternatively can use the `rules_js` provisioned one, e.g.:

```bash
bazel run @pnpm//:pnpm -- --dir $PWD outdated
```

But note that you'll need to instruct it extra configuration (runs from a sandbox).

### Recommendations

- [Bazel plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=BazelBuild.vscode-bazel)
- [buildifier](https://github.com/bazelbuild/buildtools)
- Add a `.bazelversion` if you wish to control which version to use

## Testing

Run the [Bazel way](https://bazel.build/reference/test-encyclopedia). Can run all the tests:

```bash
bazel test //...
```

Also created a `make` target:
```bash
make test
```

Or filter by tags:

```bash
bazel test //... --test_tag_filters=js
```

All [test flags/options](https://bazel.build/reference/command-line-reference#test-options) are valid.

### Writing Tests

Tests are written using only [NodeJS testing capabilities](https://nodejs.org/api/test.html).

## Querying

- List all output files from a label:
```bash
bazel cquery --output=files //src/js:a
bazel cquery --output=files //src/ts:c
```


## TODO

- more query examples
- linting?
- `@bazel/ibazel`?