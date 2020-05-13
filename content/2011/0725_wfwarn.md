---
title: Upgrading MediaWiki and SMW
date: 2011-07-25T19:51:37+00:00
tags:
  - Programming
  - configuration
  - Semantic MediaWiki
  - software
  - wikis
---
I was updating MediaWiki to [1.17](http://svn.wikimedia.org/svnroot/mediawiki/tags/REL1_17_0/) last night, and kept getting a:

> Fatal error: Call to undefined function wfWarn() in `/var/www/w/extensions/SemanticMediaWiki/includes/SMW_Setup.php` on line 49

because I was setting up SMW with `$wgServerName`:

    require_once("$IP/extensions/SemanticMediaWiki/SemanticMediaWiki.php");
    enableSemantics($wgServerName);

and this has been [deprecated](https://w.wiki/LRE) in 1.17.
As for why SMW is using the nonexistant `mfWarn()`, I haven't got time to investigate.
