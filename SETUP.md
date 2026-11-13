# Setup (about 30 minutes, one time)

## 1. GitHub repo (Day 1 project)
1. Create a new public repo named `dsa-journal` on GitHub (no README, no .gitignore).
2. On your Mac: `cd` into this folder, then
   `git init && git add . && git commit -m "chore: initial dsa-journal setup"`
   `git branch -M main && git remote add origin https://github.com/Sai-Dhanush-Sreedharagatta/dsa-journal.git && git push -u origin main`
3. Open the Actions tab and confirm the CI run is green.
   Run `mvn -B test` locally first if you have Maven and Java 17+ installed.

## 2. Weekly sprints (GitHub Projects)
1. In the repo, open Projects > New project > Board. Name it "DSA 90 days".
2. Add a custom field "Sprint" of type Iteration: length 1 week, starting Monday 16 Nov 2026 (add a short first iteration for 13-15 Nov).
3. Create one issue per sprint goal (copy from `sprints/_template.md`) and assign it to that iteration.
4. Every Sunday: tick the sprint's checklist, fill `sprints/sprint-NN.md`, and plan the next sprint.

## 3. Apple Calendar (daily brief)
1. Double-click `DSA-90-day-plan.ics` on your Mac and choose a calendar.
2. It adds 93 events at 6:00 AM with an alert; each event's notes list that day's lessons, revise days and extras.
3. They sync to your iPhone through iCloud. Check Calendar > Settings > Alerts if the alerts do not sound.

## 4. Apple Reminders (three daily items)
Create a list "DSA daily" with three reminders that repeat every day:
- Re-solve the flagged problems from today's revise days
- Log misses in error-log.md
- Commit and push to dsa-journal

## 5. Tracker and check-in
Open the Tracker tab of the plan doc on your iPhone and set today's Status (Done, Partial or Missed) before 8:30 PM. The check-in at 8:30 PM reads it.
