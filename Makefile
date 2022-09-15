.PHONY: deps compile test

default: deps compile test

deps:
	scripts/dep.sh Olical aniseed origin/master

compile:
	rm -rf lua

	# Remove this if you only want Aniseed at compile time.
	deps/aniseed/scripts/embed.sh aniseed conjure-ts

	# Also remove this embed prefix if you're not using Aniseed inside your plugin at runtime.
	ANISEED_EMBED_PREFIX=conjure-ts deps/aniseed/scripts/compile.sh

test:
	rm -rf test/lua
	deps/aniseed/scripts/test.sh
