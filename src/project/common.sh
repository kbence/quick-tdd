#!/usr/bin/env false

declare -a SUPPORTED_LANGUAGES

function in_array() {
    local needle=$1; shift
    local array=$1; shift

    for item in ${array[@]}; do
        if [[ $item == $needle ]]; then
            return 0
        fi
    done

    return 1
}

function die() {
    echo "$@"
    exit 1
}

function create_project() {
    local project_name=$1; shift
    local language=$1; shift
    local project_dir

    init_languages

    while [[ -z $project_name ]]; do
        read -p 'Project name: ' project_name
    done

    while [[ -z $language ]] || ! in_array "$language" $SUPPORTED_LANGUAGES; do
        echo "Supported languages on this platform:"
        echo ${SUPPORTED_LANGUAGES[@]} | column -c $(($COLS - 4)) | sed -e 's/^/    /'
        echo

        read -p "Language: " language
    done

    project_dir="$ROOT_DIR/projects/$project_name"

    rm -rf "$project_dir" || die "Couldn't remove directory '$project_dir'"
    mkdir -p "$project_dir" || die "Couldn't create directory '$project_dir'"
    cp -r "$ROOT_DIR/languages/$language/template"/* "$project_dir" || die "Project copy failed!"
}

function clean_projects() {
    find "$ROOT_DIR/projects" -mindepth 1 -maxdepth 1 -type d | xargs rm -rf
}

function add_language() {
    SUPPORTED_LANGUAGES+=("$1")
}

function init_languages() {
    for lang_dir in "$LANGUAGE_ROOT"/*; do
        lang_name=$(basename "$lang_dir")

        . "$lang_dir/check.sh"
        ${lang_name}_available

        if (. "$lang_dir/check.sh" && ${lang_name}_available 2>/dev/null 1>&2); then
            add_language "$lang_name"
        fi
    done
}
