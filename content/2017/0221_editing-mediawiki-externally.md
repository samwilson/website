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
  - wikimedia
  - Wikisource
---
I’ve been working on a MediaWiki gadget lately, for editing Wikisource authors’ metadata without leaving the author page. It’s fun working with and learning more about OOjs-UI, but it’s also a pain because gadget code is kept in Javascript pages in the MediaWiki namespace, and so _every single_ time you want to change something it’s a matter of saving the whole page, then clicking ‘edit’ again, and scrolling back down to find the spot you were at. The other end of things—the re-loading of whatever test page is running the gadget—is annoying and slow enough, without having to do much the same thing at the source end too.

So I’ve added a feature to [the ExternalArticles extension](https://mediawiki.org/wiki/Extension:ExternalArticles) that allows a whole directory full of text files to be imported at once (namespaces are handled as subdirectories). More importantly, it also ‘watches’ the directories and every time a file is updated (i.e. with Ctrl-S in a text editor or IDE) it is re-imported. So this means I can have `MediaWiki:Gadget-Author.js` and `MediaWiki:Gadget-Author.css` open in PhpStorm, and just edit from there. I even have these files open inside a MediaWiki project and so autocompletion and documentation look-up works as usual for all the library code. It’s even quite a speedy set-up, luckily: I haven’t yet noticed having to wait at any time between saving some code, alt-tabbing to the browser, and hitting F5.

I dare say my bodged-together script has many flaws, but it’s working for me for now!