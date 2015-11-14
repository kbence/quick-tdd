gol    = require './../src/gol'
assert = require 'assert'

describe 'Game of Life', ->
    describe 'nothing', ->
        it 'should do nothing', ->
            assert.equal gol.testMethod(), 1
