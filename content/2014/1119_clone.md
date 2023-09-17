---
id: 2156
title: A bug in the Workflow module confuses me
date: 2014-11-19T08:08:39+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2156
permalink: /2014/11/19/clone/
views:
  - "331"
dsq_thread_id:
  - "3903549611"
categories:
  - Programming
tags:
  - bugs
  - Drupal
  - Features
  - lab notebook
  - Workflow
---
I’m getting and annoying error when running reverting a Feature (`drush fr featurename`):

```
/var/www/stage.example.org$ drush fr featurename

Fatal error: __clone method called on non-object in /var/www/stage.example.org/sites/all/modules/workflow/workflow.features.inc on line 55
Drush command terminated abnormally due to an unrecoverable error.

Error: __clone method called on non-object in /var/www/stage.example.org/sites/all/modules/workflow/workflow.features.inc, line 55
```

It looks like this bug was fixed {link|2 September 2014|https://www.drupal.org/node/2317877#comment-9111791|Fatal error: __clone method called on non-object in workflow.features.inc} and is tagged as being fixed in 7.x-2.4 … but that version was released on 15 July.

**[Update:]** Ah. A coffee later, and I realise my stupidity this morning — the bug is tagged as being _in_ 7.x-2.4, not fixed in that version. Gosh, one shouldn’t post before coffee!

I apply [the patch](http://cgit.drupalcode.org/workflow/patch/?id=b58e42e227bd6e5833b9cd5dadd26cc0ee3fdad3) manually.
