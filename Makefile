.DEFAULT_GOAL := run

all: test run
.PHONY: all

run:
	bazel run //src/js:run_b
	bazel run //src/ts:run_d
.PHONY: run

test:
	bazel test //...
.PHONY: test
