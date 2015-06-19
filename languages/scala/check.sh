#!/usr/bin/env false

function scala_available() {
    which java && which javac || return 1
    return 0
}
