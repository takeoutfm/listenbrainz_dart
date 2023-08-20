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

clean:
	${DART} clean
