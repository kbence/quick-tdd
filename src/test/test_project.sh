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

for language_dir in "$LANGUAGE_ROOT"/*; do
    language="$(basename "$language_dir")"

    if (. "$language_dir/check.sh" && "${language}"_available); then
        echo "Testing template for $language..."

        if ! test_language "$language"; then
            echo "Testing template for $language has failed!"
            exit 1
        else
            echo "Testing template for $language was successful!"
        fi
    else
        echo "Skipping template for language $language as it's not available on this machine!"
    fi
done

$PROJECT clean
