---
id: 1839
title: A DataLog for Kohana ORM models
date: 2013-09-25T13:51:41+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1839
permalink: /2013/09/25/datalog/
views:
  - "6470"
categories:
  - Programming
tags:
  - auditing
  - changes
  - DataLog
  - Kohana
  - logging
  - modules
  - ORM
---
A first draft of DataLog is [up on Github now](https://github.com/samwilson/kohana_datalog). It’s a Kohana module that works with ORM models for recording every change made to the data.

From the README:

> This module is for keeping a log of changes made to ORM data. When added to an ORM model, it records who made what changes, when.
> 
> It stores actual values of the data (and usernames) rather than references to other parts of the database so that it can be as simple and robust as possible. This way it can be used with schema changes over time and still keep historical data. 

There’s more to be figured out with this. The idea of tracking both the old and new values, for instance, may be inefficient. I’m working on Userguide pages, too — one of which will go over the idea of adding faux log messages, for things like file uploads, or modifications to related models that may not warrant a log in their own right (for example, ‘through’ tables where there is no model).

I wonder if it’s of any use to anyone other than me… [hope so](http://forum.kohanaframework.org/discussion/12002/new-module-datalog-for-logging-orm-changes "I've asked for opinions on the Kohana forum").