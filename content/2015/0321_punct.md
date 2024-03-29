---
id: 2279
title: Where to work on ebooks? Wikisource vs GITenberg
date: 2015-03-21T09:34:06+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2279
permalink: /2015/03/21/punct/
categories:
  - Reading
tags:
  - books
  - cafés
  - ebooks
  - GITenberg
  - Kobo
  - Parlapa
  - punctuation
---
{{{flickr|id=35966751401|caption=Not enough photos are taken of the undersides of shop awnings.}}}

This morning I’m at _Parlapa_, the lovely little caffe opposite the town hall. It’s a good place to be sat, with a slight hangover, with some nice small WordPress code to be working on, and of course with a coffee. The only down side is the fact that the City wifi _almost_ reaches here, so I’ve got the most tantalising of faint signals and so keep trying to connect; I should give that up, and read a book.

I’m re-reading _Tolstoy’s Dictaphone_, which is a terrific book. But I’ve left it at home, un-terrifically, and so instead am reading [_Live and Let Live_ by Catharine Maria Sedgwick](https://en.wikisource.org/wiki/Live_and_Let_Live). Only read the first two pages so far so I’ve no idea what it’s about, and anyway keep getting distracted by typographical errors (so far, all resulting from the fact that Kobos don’t support small-caps. What a joke!).

Talking of small-caps, there’s [movement](https://github.com/gitenberg-dev/wiki/wiki) at the [GITenberg](https://gitenberg.github.io/) station, with a project underway to convert PG books to unicode and to use proper punctuation characters (for quotation marks and dashes, at least). The idea is to use Asciidoc, but there is no standard way to express small-caps. In fact, none of the popular lightweight markup languages seem to have small-caps; what an oversight!

So if I were with a more solid connection, I’d try to run the punctuation-fixing scripts against one of Mr Gissing’s works. Because there’s something nicer about working on books as stand-alone Git repositories, rather than in the mammoth universe of Wikisource and the WMF. A feeling that one is producing single _editions_, and perhaps a number of different formats for each — and is able to give each its due attention. The wikitext-as-source-format paradigm gets a bit tiring sometimes, because although the HTML output is great, and that makes for good ebooks (well, Kobo and its small-caps-ignorance aside), I’d really like to be able to produce printable (and thus bindable) output as well. Say, via LaTeX. And maybe Asciidoc is one way of doing that.

Really, the main thing that PG is missing (and GITenberg, although it’s probably easier to rectify there) is the ability to confer with the original source scans.