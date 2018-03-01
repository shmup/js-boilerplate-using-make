.PHONY: all clean

babel            := node_modules/.bin/babel
src_files        := $(shell find src/ -name '*.js')
transpiled_files := $(patsubst src/%,lib/%,$(src_files))

all: node_modules $(transpiled_files)

lib/%: src/%
	mkdir -p $(dir $@)
	$(babel) $< --out-file $@ --source-maps

clean:
	rm -rf lib

node_modules: package.json yarn.lock
	yarn install
