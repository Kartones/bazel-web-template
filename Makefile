.PHONY: default test run

run:
	bazelisk run //src:run_b

test:
	bazelisk test //...
