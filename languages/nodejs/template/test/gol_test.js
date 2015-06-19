var gol = require('./../src/gol');

describe("Game of Life", function() {
    describe("nothing", function() {
        it("should do nothing", function() {
            assert.equals(gol.testMethod(), 1);
        });
    });
});
