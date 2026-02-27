.DEFAULT_GOAL := run

run:
	bazel run //src/js:run_b
	bazel run //src/ts:run_d
.PHONY: run

test:
	bazel test //...
.PHONY: test
