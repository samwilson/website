---
title: New feature for ia-upload
date: 2017-02-06 16:18:36 +08:00
timezone: Australia/Perth
tags:
  - Open content
  - Programming
  - djvu
  - Internet Archive
  - Wikisource
  - wikimedia
---
I have been working on [an addition](https://github.com/wikisource/ia-upload/pull/18) to
the [IA Upload tool](https://wikitech.wikimedia.org/wiki/Tool:IA_Upload) these last few days,
and it’s ready for [testing](https://tools.wmflabs.org/ia-upload/test/).
Hopefully we’ll merge it tomorrow or the next day.

This is the first time I’ve done much work with the internal structure of DjVu files,
and really it’s all been pretty straight-forward. A couple of odd bits about matching element and page names up between things,
but once that was sorted it all seems to be working as it should.

It’s a shame that the Internet Archive has discontinued their production of DjVu files,
but I guess they’ve got their reasons, and it’s not like anyone’s ever _heard_ of DjVu anyway.
I don’t suppose anyone other than Wikisource was using those files.
Thankfully they’re still producing the DjVu XML that we need to make our own DjVus,
and it sounds like they’re going to continue doing so (because they use the XML to produce the text versions of items).
