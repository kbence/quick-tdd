.PHONY: test autotest

all: gems

test: gems
	rspec

autotest: gems
	rspec --configure autotest

gems:
	bundle install
