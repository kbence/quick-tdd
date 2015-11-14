#!/usr/bin/env false

NODE_PATH=

function javascript_available() {
    NODE_PATH=$(which nodejs node | head -n 1)

    if [[ -z $NODE_PATH ]] && node -e 'process.exit(0)'; then
        return 1
    fi

    return 0
}
