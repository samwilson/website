---
id: 1779
title: SemanticForms popup forms are tiny
date: 2013-09-18T09:28:23+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1779
permalink: /2013/09/18/popup/
views:
  - "897"
categories:
  - Programming
tags:
  - jQuery
  - MediaWiki
  - popups
  - SemanticForms
  - SemanticMediaWiki
---
Popup forms created with `{{#formlink:popup}}` in [SemanticForms](https://www.mediawiki.org/wiki/Extension:Semantic_Forms) not showing the right size (tiny, like 40 pixel square)? Skins should have their main page content in a block with an ID of ‘content’, e.g.: `<div id="content">`…`</div>`