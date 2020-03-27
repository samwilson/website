---
title: Basildon very pre-alpha
date: 2020-01-23
tags:
  - basildon
---
For some reason I'm experimenting with writing my own static site generator.
I know I shouldn't, because there are a millon of them.
But if there *are* a million of them... why not add another?! Can't do any harm.

The things I like about mine are that all the metadata (from Yaml frontmatter)
is queryable from an SQLite database, right in the Twig templates.
Messy mixed-up presentation and logic? Why yes, there is!
The other cool thing is being able to add Sparql queries for Wikidata,
right in the templates as well.
This means I can do things like add `wikidata` keys to tags' frontmatter,
and then display nice [{{Wikidata Infobox}}](https://commons.wikimedia.org/wiki/Template:Wikidata_Infobox)-style summaries of my sites' tags.
