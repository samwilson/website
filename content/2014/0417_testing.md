---
id: 2029
title: Integration (and no unit) tests
date: 2014-04-17T07:33:43+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2029
permalink: /2014/04/17/testing/
views:
  - "1751"
dsq_thread_id:
  - "3908989346"
categories:
  - Programming
tags:
  - databases
  - design
  - Doing it the WRONG way
  - integration tests
  - Kohana
  - ORM
  - testing
  - unit tests
---
I’ve been writing lots of integration tests lately, for a system that has zero unit tests. Does this make me a bad programmer? Probably. But it’s so easy! This is in Kohana, using ORM, and so the model basically _is_ the database (which idea I rather like), and mocking it or splitting it out to be separate is just a pain. Far less code to write if one can test the whole interaction of the system at once.

I am being slightly tongue-in-cheek here, because I do realise that the maintenance burden of a system built with tight coupling between the various layers is likely to increase contiunually (to a point where someone at somepoint says “oh sod it, let’s rebuild from scratch on Drupal”). But for the multitude of systems that are basically just CRUD, the approach of writing tests that mimic the code seen in controllers is pretty simple and neat.