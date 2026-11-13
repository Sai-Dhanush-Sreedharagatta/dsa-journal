package dsa;

/**
 * Example solution layout. Header comment per file:
 * Problem: <link to the problem>
 * Pattern: <pattern>
 * Insight: <one line>
 * Complexity: O(n) time, O(1) space
 */
public final class Warmup {
    private Warmup() {}

    public static int sum(int[] values) {
        int total = 0;
        for (int v : values) total += v;
        return total;
    }
}
