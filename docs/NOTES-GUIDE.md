# How I take notes (read once, then follow)

The repo mirrors the AlgoMaster course: one folder per section, one folder per subsection, one folder per lesson or problem. Each item has its own notes and its own solution.

```
sections/06-arrays/
  README.md                      section notes: ideas, triggers, template, complexity, traps, self-test
  02-array-manipulation/
    01-move-zeroes/
      notes.md                   problem notes
      Solution.java              accepted solution
      dry-run.png                optional, exported from Notability
```

## Start an item (10 seconds)
```
scripts/start.sh 6 "move zeroes"            # problem: notes.md + Solution.java
scripts/start.sh --lesson 6 "introduction"  # lesson: notes.md only
```
The first number is the section number from `sections/README.md`. If the title matches more than one item, the script lists them so you can be more specific.

## While you work
- Lesson: fill Key ideas and the one-line takeaway in `notes.md`.
- Problem: write your first idea, the key insight and the approach in `notes.md`. Paste the accepted solution into `Solution.java` and fill the header (insight, complexity, mistakes).
- Hard or missed problem: set `Flag: yes` in `notes.md`, and log the miss: `scripts/log-miss.sh <day> "<problem>" <tag> "<what went wrong>" "<rule>"`.
- Revision days: run `scripts/flagged.sh` to see the items to redo, then add a row to each item's Revision log.

## When a section is finished (30 minutes)
Fill in the section's `README.md`: key ideas, trigger signals, the Java template (write it from memory first), complexity table, traps, self-test and a five-line summary. Tick the contents list and update the status in `sections/README.md`.

## Handwritten work
Use Notability for scratch. When a page is worth keeping, export it (Share, then Image) into the item's folder and link it in `notes.md`.

## Rules
- Write explanations in your own words. Do not paste problem statements or editorials; link to the problem.
- Solutions are plain `.java` files. CI does not compile them, so a bad paste never breaks the build.
- `patterns/` is for cross-section cheat sheets (for example "two pointers vs sliding window"), written during the last two weeks.
