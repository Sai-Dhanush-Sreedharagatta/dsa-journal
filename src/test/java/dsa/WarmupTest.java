package dsa;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class WarmupTest {
    @Test
    void sumAddsValues() {
        assertEquals(6, Warmup.sum(new int[] {1, 2, 3}));
    }

    @Test
    void sumOfEmptyIsZero() {
        assertEquals(0, Warmup.sum(new int[] {}));
    }
}
