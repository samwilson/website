---
id: 1993
title: Move a DokuWiki namespace to a different wiki
date: 2014-02-09T11:00:37+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1993
permalink: /2014/02/09/dw-ns-move/
views:
  - "6402"
dsq_thread_id:
  - "3857936003"
categories:
  - Programming
tags:
  - DokuWiki
  - hierarchies
  - namespaces
  - organising
  - wikis
---
I started using DokuWiki a few years ago, and didn’t think very correctly about how to organise the _page_ and _media_ hierarchies. Now I know more about what I want in [wiki.samwilson.id.au](http://wiki.samwilson.id.au/) and how I need to be able to give people access to it, I’ve decided to reorganise the whole thing. [Namespaces](https://www.dokuwiki.org/namespaces) shall now be used for access control, not topics. The problem with this change is that there would be a pile of namespaces that would no longer exist but which would still need to be protected (or have their revision history removed). Most of their content isn’t going to remain on the site (thanks to a pile of family history stuff being moved into [Webtrees](http://webtrees.net/) at [cfbarker.archives.org.au](http://cfbarker.archives.org.au "C. F. Barker Archives")) and so it seemed easier to start with a clean slate and move only selected bits to it. Hence, how to move a namespace into another wiki:

  1. Copy the `data/{attic,media,media_attic,media_meta,meta,pages}/<ins>nsname</ins>` directories from the old wiki’s data directory to that of the new.
  2. Clear the new wiki’s cache.
  3. Run `php bin/indexer.php`.
  4. Browse the new wiki and check that all is okay.

Easy, really.