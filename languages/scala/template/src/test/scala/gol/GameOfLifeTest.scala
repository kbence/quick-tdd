package gol

import specs2.*

class GameOfLifeTest extends Specification {
    val gol = new GameOfLife()

    def testSomething(): Unit = {
        gol.method() mustEqual 1
    }
}
