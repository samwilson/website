---
id: 2607
title: Quickly adding editions to Wikidata
date: 2016-04-13T12:55:51+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2607
permalink: /2016/04/13/quickdata/
categories:
  - Open content
tags:
  - books
  - metadata
  - Wikidata
---
To add a new edition of a book, using [QuickStatements](https://tools.wmflabs.org/wikidata-todo/quick_statements.php):

<pre lang="txt">CREATE
LAST	Len	"The Great Gatsby"
LAST	P629	Q214371
LAST	Den	"The Penguin Classics edition of the book"
LAST	P31	Q3331189
LAST	P123	Q11281443
</pre>

The first two lines need to be changed to match the book’s _title_ and work’s _Q-number_ respectively. Of course other metadata should probably be added too, such as date and place of publication.