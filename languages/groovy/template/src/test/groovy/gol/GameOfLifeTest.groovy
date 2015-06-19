package gol;

import spock.lang.*;

public class GameOfLifeTest extends Specification {
    GameOfLife gol;

    def setup() {
        gol = new GameOfLife();
    }

    def "test something"() {
        expect:
        1 == gol.method()
    }
}
