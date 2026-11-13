#!/usr/bin/env bash
# Lists every item whose notes.md says "Flag: yes".
cd "$(dirname "$0")/.."
grep -rl --include=notes.md "^- Flag: yes" sections | sort
