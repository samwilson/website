---
id: 1251
title: WebDB updated
date: 2012-08-21T09:01:02+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1251
permalink: /2012/08/21/filters/
views:
  - "325"
categories:
  - Programming
tags:
  - bugs
  - databases
  - foreign keys
  - PHP
  - sorting
  - WebDB
---
Yesterday I added a little fix to [WebDB](https://github.com/samwilson/kohana_webdb) for a bug that prevented filtering on column names that occur in both the table being filtered _and_ any of the tables referred to by foreign keys. This most often applied to `id` columns.

**[Update:]** And today I’ve (hopefully) fixed the problem with foreign-key fields in edit forms not being able to be emptied. How did that live this long?! Sorry.