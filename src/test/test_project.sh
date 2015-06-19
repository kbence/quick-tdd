#!/bin/bash

ROOT_DIR=$(cd $(dirname "$0")/../.. && pwd)
LANGUAGE_ROOT="$ROOT_DIR/languages"
PROJECT="$ROOT_DIR/bin/project"
PROJECT_DIR="$ROOT_DIR/projects"

function test_language() {
    local lang=$1; shift
    local project_name="${lang}_test"

    $PROJECT clean
    $PROJECT create "$project_name" "$lang"
    (cd "$PROJECT_DIR/$project_name" && make test)

    return $?
}

for language in "$LANGUAGE_ROOT"/*; do
    if ! test_language "$(basename "$language")"; then
        echo "Testing with language $language has failed!"
    fi
done

$PROJECT clean
