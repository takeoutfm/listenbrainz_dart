# Copyright 2023 defsub

DART = dart

.PHONY: test

all: test

update:
	${DART} pub get

generate:
	${DART} run build_runner build --delete-conflicting-outputs

test:
	${DART} test

check:
	${DART} pub get
	${DART} analyze
	${DART} pub publish --dry-run

publish:
	${DART} pub publish

clean:
	${DART} clean
