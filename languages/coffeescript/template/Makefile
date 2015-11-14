.PHONY: test autotest

all: modules

test: modules
	./node_modules/.bin/mocha --compilers coffee:coffee-script/register -R spec

autotest: modules
	./node_modules/.bin/mocha --compilers coffee:coffee-script/test -R spec --watch

modules:
	npm install
