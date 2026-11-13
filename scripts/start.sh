#!/usr/bin/env bash
# Start an item: creates its folder with notes.md and Solution.java.
# Usage: scripts/start.sh [--lesson] <section-number> "<part of the title>"
# Examples:
#   scripts/start.sh 6 "move zeroes"
#   scripts/start.sh --lesson 6 "introduction"     (lesson only: notes.md, no Solution.java)
set -euo pipefail
cd "$(dirname "$0")/.."

lesson=0
if [ "${1:-}" = "--lesson" ]; then lesson=1; shift; fi
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 [--lesson] <section-number> \"<part of the title>\""; exit 1
fi
sec=$(printf "%02d" "$((10#$1))")
query="$2"

matches=$(awk -F'\t' -v s="$sec" -v q="$query" 'BEGIN{q=tolower(q)} $1==s && index(tolower($7),q)>0 {print}' scripts/curriculum.tsv)
if [ -z "$matches" ]; then
  echo "No item in section $sec matches \"$query\". See sections/$sec-*/README.md for the exact titles."; exit 1
fi
count=$(printf "%s\n" "$matches" | wc -l | tr -d ' ')
if [ "$count" -gt 1 ]; then
  exact=$(printf "%s\n" "$matches" | awk -F'\t' -v q="$query" 'BEGIN{q=tolower(q)} tolower($7)==q {print}')
  if [ -n "$exact" ] && [ "$(printf "%s\n" "$exact" | wc -l | tr -d ' ')" -eq 1 ]; then
    matches="$exact"
  else
    echo "More than one item matches \"$query\". Be more specific:"
    printf "%s\n" "$matches" | awk -F'\t' '{printf "  - %s  (%s)\n", $7, $4}'
    exit 1
  fi
fi

secfolder=$(printf "%s\n" "$matches" | cut -f2)
subfolder=$(printf "%s\n" "$matches" | cut -f4)
itemfolder=$(printf "%s\n" "$matches" | cut -f6)
title=$(printf "%s\n" "$matches" | cut -f7)
dir="sections/$secfolder/$subfolder/$itemfolder"
if [ -e "$dir/notes.md" ]; then echo "$dir already exists"; exit 1; fi
mkdir -p "$dir"
today=$(date +%Y-%m-%d)

if [ "$lesson" -eq 1 ]; then
cat > "$dir/notes.md" <<EOF
# $title

- Section: $secfolder / $subfolder
- Date: $today

## Key ideas (your words)
-

## Example

## Java snippet
\`\`\`java

\`\`\`

## One-line takeaway

## Self-test questions
1.
2.
EOF
else
cat > "$dir/notes.md" <<EOF
# $title

- Section: $secfolder / $subfolder
- AlgoMaster link:
- Date: $today  |  Time: __ min  |  Outcome: solved / hint / failed
- Pattern:
- Flag: no

(Change "Flag: no" to "Flag: yes" to revise this at D-1, D-3, D-7, D-21. List flagged items with scripts/flagged.sh.)

## The problem in one line

## First idea, and why it did or did not work

## Key insight

## Approach
1.
2.

## Dry run
Export the Notability page into this folder (for example dry-run.png) and link it:
![dry run](dry-run.png)

## Complexity
Time:    Space:

## Edge cases

## Mistakes (also add one line to error-log.md)

## Related problems

## Revision log
| Date | Solved cold? | Notes |
| --- | --- | --- |
EOF
cat > "$dir/Solution.java" <<EOF
/**
 * Problem:   $title
 * Section:   $secfolder / $subfolder
 * Date:      $today
 * Outcome:   solved / hint / failed
 *
 * Insight:
 * Time:      O(?)    Space: O(?)
 * Mistakes:
 */
class Solution {
    // paste your accepted solution here
}
EOF
fi
echo "Created $dir"
ls "$dir"
