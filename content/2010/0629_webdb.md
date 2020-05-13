---
id: 419
title: WebDB database interface, a Kohana module
date: 2010-06-29T14:54:11+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=419
permalink: /2010/06/29/webdb/
views:
  - "389"
dsq_thread_id:
  - "3857935887"
categories:
  - Programming
tags:
  - databases
  - Kohana
  - WebDB
---
For the past month or so I have been working on rebuilding my little database interface — called WebDB — as a Kohana module. It’s now ready for a first **alpha** release; you can find it at [github.com/samwilson/kohana_webdb](http://github.com/samwilson/kohana_webdb). I’ll be putting a demo up soon, and hopefully getting a project set up for it at [dev.kohanaframework.org/projects](http://dev.kohanaframework.org/projects).

This is a project that I’ve been working on, now and then, for the last four or five years. It started off as a bunch of poorly-designed PHP scripts, morphed for a little while into a PEAR-based thing called Cawitm (the ‘Constraint-Aware Web Interface For Mysql’!), then through a year’s trouble as a Zend app, and has finally found its home as a Kohana module. Hence, this ‘first’ release is v.4.0a.

There are a whole bunch of things that I’m planning on adding. Obvious things, like exporting and column sorting (actually, the code for those two is done; I’ll be adding it in the next couple of weeks) as well as some less-than-obvious ones like a calendar view of any `date` column, graphing (with [GraphViz](http://www.graphviz.org/)) self-referential tables, and a map view of any table with `latitude` and `longitude` columns. If anyone’s got any other thoughts, I’d love to hear them.