#!/usr/bin/env false

function groovy_available() {
    which java && which groovyc || return 1
    return 0
}
