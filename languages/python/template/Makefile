.PHONY: all test autotest modules

all: modules

test: modules
	python -m unittest -- gol_test

modules:
	pip install -r requirements.txt
