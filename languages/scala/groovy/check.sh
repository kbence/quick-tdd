#!/usr/bin/env false

function groovy_available() {
    which java && which javac || return 1
    return 0
}
