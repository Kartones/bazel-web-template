# bazel-web-template

## Run

`bazelisk run //src:run-b`


## Setup

## Development

`bazelisk build //...`

### Setup

Each time dependencies change/get updated, run `pnpm install` (toolchains use `pnpm-lock.yaml`).

#### Requirements

- [nodejs](https://nodejs.org)
- [npm](https://www.npmjs.com)
- [pnpm](https://pnpm.io) <- TODO: Change to using rules_js-provided one

#### Recommendations

- [Bazel plugin for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=BazelBuild.vscode-bazel)
- [Bazelisk](https://github.com/bazelbuild/bazelisk) instead of [Bazel](https://github.com/bazelbuild/bazel), it will download new versions
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
- some macro example? maybe a thin wrapper over Aspect rules?