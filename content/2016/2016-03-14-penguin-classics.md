---
id: 2597
title: Penguin Classics on Wikisource
date: 2016-03-14T15:49:03+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2597
permalink: /2016/03/14/penguin-classics/
categories:
  - Open content
tags:
  - books
  - catalogues
  - literature
  - Penguin Classics
  - Reading
  - Wikidata
  - Wikimedia
---
As a way of learning Sparql and more about Wikidata, I&#8217;m trying to make a list of which pre-1924 Penguin Classics are on Wikisource.

Penguin lists their books at [penguin.com.au/browse/by-imprint/penguin-classics](https://www.penguin.com.au/browse/by-imprint/penguin-classics).

The following Wikidata Query Service [query](http://tinyurl.com/zcrgxxk) lists all editions published by Penguin, their date of original publication, and whether there&#8217;s an Index page on Wikisource for the work or edition.

<pre lang="sparql">SELECT ?edition ?editionLabel ?work ?workLabel ?originalPublicationDate ?wikisourceIndexForWork ?wikisourceIndexForEdition
WHERE
{
  ?edition wdt:P31 wd:Q3331189 .
  ?edition wdt:P577 ?publicationDate .
  ?edition wdt:P123 ?publisher .
  FILTER(
    ?publisher = wd:Q1336200 # Penguin Books Q1336200
    || ?publisher = wd:Q11281443 # Penguin Classics Q11281443
  )
  ?edition wdt:P629 ?work .
  OPTIONAL{ ?work wdt:P577 ?originalPublicationDate } .
  OPTIONAL{ ?work wdt:P1957 ?wikisourceIndexForWork } .
  OPTIONAL{ ?edition wdt:P1957 ?wikisourceIndexForEdition } .
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
</pre>

I&#8217;m not sure how often the WDS data is updated, but so far it&#8217;s not being very useful for on-the-fly checking of recent updates. I&#8217;m sure there&#8217;s a better way of doing that though.