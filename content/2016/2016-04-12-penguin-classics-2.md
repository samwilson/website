---
id: 2600
title: Penguin Classics portal on Wikisource
date: 2016-04-12T17:31:35+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2600
permalink: /2016/04/12/penguin-classics-2/
categories:
  - Open content
tags:
  - books
  - literature
  - Penguin Classics
  - Reading
  - Wikidata
  - Wikimedia
  - Wikisource
---
I&#8217;ve made a start of a system to pull data from Wikidata and generate a [portal for the Penguin Classics](https://en.wikisource.org/wiki/Portal:Penguin_Classics), with appropriate links for those that are on Wikisource or are ready to be transcribed.

I&#8217;m a bit of a [Sparql](https://en.wikipedia.org/wiki/SPARQL) newbie, so perhaps this could&#8217;ve been done in a single query. However, I&#8217;m doing it in two stages: first, gathering all the &#8216;works&#8217; that have at least one edition published by Penguin Classics, and then finding all editions of each of those works and seeing if any of them are on Wikisource. Oh, and including the ones that aren&#8217;t, too!

[Wikidata:WikiProject Books](https://www.wikidata.org/wiki/Wikidata:WikiProject_Books) sort of uses the [FRBF model](https://en.wikipedia.org/wiki/Functional_Requirements_for_Bibliographic_Records) to represent primarily books and editions (&#8216;editions&#8217; being a combination of _manifestation_ and _expression_ levels of the FRBF; i.e. an edition realises and embodies a work). So most of the metadata we want exists at the &#8216;work&#8217; level: title, author, date of first publication, genre, etc.

At the &#8216;edition&#8217; level we look for a link to Wikisource (because a main-namespace item on Wikisource is an edition&#8230; although this gets messy; see below), and a link to the edition&#8217;s transcription project. Actually, we also look for these on the work itself, because often Wikidata has these properties there instead or as well — which is wrong.

Strictly speaking, the work metadata shouldn&#8217;t have anything about where the work is on Wikisource (either mainspace or Index file). The problem with adhering to this, however, is that by doing so we break interwiki links from Wikisource to Wiktionary. Because a Wikipedia article is (almost always) about a work, and we want to link a top-level Wikisource mainspace pages to this work&#8230; and the existing systems for doing this don&#8217;t allow for the intermediate step of going from Wikisource to the edition, then to the work and then to Wikipedia.

So for now, my [scruffy little script](http://static.samwilson.id.au/2016/wikisource-penguin-classics.php) looks for project links at both levels, and seems to do so successfully.

The main problem now is that there&#8217;s just not much data about these books on Wikidata! I&#8217;ll get working on that next&#8230;