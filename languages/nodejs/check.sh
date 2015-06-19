#!/usr/bin/env false

NODE_PATH=

function nodejs_available() {
    NODE_PATH=$(which nodejs node)

    if [[ -z $NODE_PATH ]] && node -e 'process.exit(0)'; then
        return 1
    fi

    return 0
}
