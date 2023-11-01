# bazel-web-template

## Run

`bazelisk run //src:run_b`


## Setup

## Development

`bazelisk build //...`

### Rule wrappers

Most external rules are wrapped at `rules` folder, so they can be modified, refactored or simplified at will.

If an external rule is only used inside other rules/macros and not from `BUILD` files, initially there's no need of wrapping them.


### Setup

Each time dependencies change/get updated, run `pnpm install` (toolchains use `pnpm-lock.yaml`).

#### Requirements (for updating & local dev)

- [nodejs](https://nodejs.org)
- [npm](https://www.npmjs.com)
- [pnpm](https://pnpm.io) <- TODO: Change to using rules_js-provided one

#### Recommendations

- [Bazel plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=BazelBuild.vscode-bazel)
- [Bazelisk](https://github.com/bazelbuild/bazelisk) instead of directly using [Bazel](https://github.com/bazelbuild/bazel)
- [buildifier](https://github.com/bazelbuild/buildtools)

## Testing

`bazelisk test //...`

### TODO

- ts
- tests (node)
- query examples
- .bazelrc
- more js base settings?
- linting?
- `@bazel/ibazel`?
- some macro example