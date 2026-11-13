#!/usr/bin/env bash
# Usage: scripts/log-miss.sh <day-number> "<problem>" <tag> "<what went wrong>" "<rule for next time>"
# Tags: concept-gap | wrong-pattern | implementation-bug | missed-edge-case
set -euo pipefail
cd "$(dirname "$0")/.."
if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <day-number> \"<problem>\" <tag> \"<what went wrong>\" \"<rule>\""; exit 1
fi
day="$1"; problem="$2"; tag="$3"; wrong="$4"; rule="$5"
case "$tag" in
  concept-gap|wrong-pattern|implementation-bug|missed-edge-case) ;;
  *) echo "Tag must be one of: concept-gap, wrong-pattern, implementation-bug, missed-edge-case"; exit 1;;
esac
today=$(date +%Y-%m-%d)
revise=$(date -v+1d +%Y-%m-%d 2>/dev/null || date -d "+1 day" +%Y-%m-%d)
wrong=${wrong//|/\\|}; rule=${rule//|/\\|}; problem=${problem//|/\\|}
echo "| $today | D$day | $problem | $tag | $wrong | $rule | $revise |" >> error-log.md
echo "Logged. Revise on $revise."
