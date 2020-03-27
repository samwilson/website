---
id: 1467
title: Printable WeRelate
date: 2013-04-08T06:08:38+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1467
permalink: /2013/04/08/printable-werelate/
views:
  - "205"
categories:
  - Programming
tags:
  - extensions
  - genealogy
  - MediaWiki
  - Printable WeRelate
  - trees
  - WeRelate
---
Last year I wrote a [little script](http://www.werelate.org/wiki/WeRelate:Printable-WeRelate) for producing GraphViz graphs, and LaTeX books, from [werelate.org](http://werelate.org/) family history data. I&#8217;ve been tweaking it a bit now and then, and using it for my mum&#8217;s genealogical research. It works, but the more I want to do with it the more I think it needs a good ground-up refactoring. So, I&#8217;ve set to work turning it into a MediaWiki extension, so I can use an installation of MediaWiki as the cache (instead of text files), and update this installation in a separate operation to the tree-generation stuff. (I found that I was playing around with regenerating things more often that I wanted to be waiting for downloading modified data, and it was set to check for modifications if it&#8217;d been longer than a day since the last check&#8230;) The other big advantage of sync&#8217;ing into a local MW is that I&#8217;ll have a complete, working, backup of all our data.

The basic idea is that the _ancestor_ and _descentant_ lists, which define the starting points for the tree traversal, will be defined in normal wiki pages, and both the syncronisation and the tree-generation processes will read these and do what they need to do.

I&#8217;m setting up a test wiki at <http://test.archives.org.au>, if anyone&#8217;s interested.