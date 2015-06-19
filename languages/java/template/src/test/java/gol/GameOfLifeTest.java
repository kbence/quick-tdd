package gol;

import static org.junit.Assert.*;
import org.junit.*;

public class GameOfLifeTest {
    GameOfLife gol;

    @Before
    public void setUp() {
        gol = new GameOfLife();
    }

    @Test
    public void testSomething() {
        assertEquals("equals", 1, gol.method());
    }
}
