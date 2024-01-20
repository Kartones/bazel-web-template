.PHONY: default test run

run:
	bazelisk run //src/js:run_b
	bazelisk run //src/ts:run_d

test:
	bazelisk test //...
