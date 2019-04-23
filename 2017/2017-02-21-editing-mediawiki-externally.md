---
id: 2749
title: Editing MediaWiki pages in an external editor
date: 2017-02-21T14:43:33+00:00
author: Sam Wilson
layout: post
guid: https://samwilson.id.au/?p=2749
permalink: /2017/02/21/editing-mediawiki-externally/
categories:
  - Programming
tags:
  - gadgets
  - MediaWiki
  - Wikimedia
  - Wikisource
---
I&#8217;ve been working on a MediaWiki gadget lately, for editing Wikisource authors&#8217; metadata without leaving the author page. It&#8217;s fun working with and learning more about OOjs-UI, but it&#8217;s also a pain because gadget code is kept in Javascript pages in the MediaWiki namespace, and so _every single_ time you want to change something it&#8217;s a matter of saving the whole page, then clicking &#8216;edit&#8217; again, and scrolling back down to find the spot you were at. The other end of things—the re-loading of whatever test page is running the gadget—is annoying and slow enough, without having to do much the same thing at the source end too.

So I&#8217;ve added a feature to [the ExternalArticles extension](https://mediawiki.org/wiki/Extension:ExternalArticles) that allows a whole directory full of text files to be imported at once (namespaces are handled as subdirectories). More importantly, it also &#8216;watches&#8217; the directories and every time a file is updated (i.e. with Ctrl-S in a text editor or IDE) it is re-imported. So this means I can have `MediaWiki:Gadget-Author.js` and `MediaWiki:Gadget-Author.css` open in PhpStorm, and just edit from there. I even have these files open inside a MediaWiki project and so autocompletion and documentation look-up works as usual for all the library code. It&#8217;s even quite a speedy set-up, luckily: I haven&#8217;t yet noticed having to wait at any time between saving some code, alt-tabbing to the browser, and hitting F5.

I dare say my bodged-together script has many flaws, but it&#8217;s working for me for now!