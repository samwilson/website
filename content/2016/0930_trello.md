---
id: 2683
title: Trello backup script
date: 2016-09-30T11:18:15+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2683
permalink: /2016/09/30/trello/
categories:
  - Miscellaneous
tags:
  - backups
  - Trello
---
Trello can be quite a useful task-tracker, but it’s got the usual pitfall of being a cloud service that might change at any time and become unusable (expensive or stupid or whatever).

Luckily, it’s a simple matter to set up a daily cronjob to run Matthieu Aubry’s [trello-backup](https://github.com/mattab/trello-backup) script. It produces a single JSON file for each board.

Now, _restoring_ from that file might be a different matter…