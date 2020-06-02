---
title: Pruning find
date: 2020-06-02 17:12:00 +0800
timezone: Australia/Perth
location: Fremantle
tags:
  - Bash
  - CLI
---
I don't know why I always forget how to exclude things from `find` results.

[This answer](https://stackoverflow.com/a/1489405/99667) by Laurence Gonsalves on Stack Overflow
has made me realise I was thinking about it wrongly:
"it's an action (like `-print`), not a test (like `-name`). It alters the "to-do" list, but always returns true."

I'm searching for a file in a MediaWiki `images/` directory, but don't want to see the matching images under `thumb/`.
This seems to do it:

    find . -name 'thumb' -prune -o -name '*lorem*'

The `-o` is *or*, and the part after it is not evaluated if the part before is true.
