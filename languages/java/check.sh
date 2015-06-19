#!/usr/bin/env false

function java_available() {
    which java && which javac || return 1
    return 0
}
