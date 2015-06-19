#!/usr/bin/env false

function ruby_available() {
    which -s ruby
    return $?
}
