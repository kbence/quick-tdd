# Quick-TDD

This repository contains skeleton projects for a few languages to help people up set up an environment mainly on Code Retreat events.

## Quick start

    git clone https://github.com/kbence/quick-tdd.git
    cd quick-tdd
    ./bin/project create

This will ask you about the project name and language you'd like to use and create it in the `./projects/<project_name>/` directory.

To run the tests, you only need to `cd` there and run `make test` (you'll need to have a `make` command installed).

## Clean

The `clean` subcommand is available to quickly delete code from `./projects/` (it will delete every single project created!).

## How to add new languages?

The language templates are defined it the directory `./languages/<language_name>`. The directory must contain a script with the name `check.sh` which contains a bash function named `<language_name>_available`. This method must return 0 if the language is supported on the platform (it's a good idea to check every command and dependency which is needed to run the tests on a specific language).

The `template` directory must contain the skeleton of the project. It'll be copied to `./projects/<project_name>` upon project creation (template variables are not supported at the moment). It's a good idea to add a `Makefile` to have the same interface as the other projects (check out one of the languages if you are not sure how to write a `Makefile`).

