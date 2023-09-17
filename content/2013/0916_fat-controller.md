---
id: 1767
title: No Topham Hatt here, please
date: 2013-09-16T09:10:22+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1767
permalink: /2013/09/16/fat-controller/
views:
  - "734"
categories:
  - Programming
tags:
  - CLI
  - controllers
  - design
  - Kohana
  - Minion
  - tasks
  - tenuous literary references
  - testing
  - Thomas the Tank Engine
  - unit testing
---
In [Kohana](http://kohanaframework.org) (with Minion), *actions* and *[tasks](http://kohanaframework.org/3.3/guide/minion/tasks)* are sort of similar. Both should be ‘thin’ and do nothing more than create objects of the domain model, and direct bits of those objects to various systems of output. Keeping them both in my mind today is helping me divorce the domain model’s interface from the usual web-based interaction: if I imagine that I’ve got to do the same things in both a web-based action, and a terminal-based task, then they seem to end up thinner.

Testing comes into it as well: the test method (I mean the `do_a_thing_test()` method, not the method-of-testing) is again similar to the actions and tasks. It mustn’t know much or do much. It only differs in that, in place of setting up some sort of output, it makes assertions about the domain objects.
