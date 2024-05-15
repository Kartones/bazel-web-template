.DEFAULT_GOAL := run

run:
	bazelisk run //src/js:run_b
	bazelisk run //src/ts:run_d
.PHONY: run

test:
	bazelisk test //...
.PHONY: test
