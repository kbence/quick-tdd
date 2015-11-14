.PHONY: test autotest

all: modules

test: modules
	./node_modules/.bin/mocha

autotest: modules
	./node_modules/.bin/mocha --watch

modules:
	npm install
