---
id: 228
title: Back to the bench (and a bit of code)
date: 2008-07-05T17:34:07+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/blog/?p=228
permalink: /2008/07/05/back-to-the-bench/
views:
  - "229"
categories:
  - Programming
  - Woodworking
tags:
  - personal email archiver
  - saw horses
  - saw stools
  - workbench
  - workshop
---
I have arrived at long last! I’ve been in WA for two weeks already, and I have only in the last couple of days a) been for a swim, and b) unpacked my tools and started to think (once again) about wood. I’ve been more concerned, for some reason, about getting a job, or working on porting my email archiving software to Java — now I’m back! Back in WA, and back at the workbench!

There are now a myriad projects that need my attention, and I just need to sort out in what order I’ll tackle them: I need _shelves_, that’s pretty high on the list; before I get get going on them, however, I need (well, maybe don’t _need_, but it’d be nice) somewhere to sharpen my tools, a bench that can get wet; I’d get going with that, then, but I’d like first to have just a couple of simple saw horses to have nearby to dock longer lengths of timber and whatnot. So that’s where I’m going to start:

{{{flickr|id=28402904073}}}

And yes, to figure out the angles I had to resort to PHP — I really aught to get myself a calculator that can do trig stuff…

***

On the IT front: I am as intent as ever to get working on some sort of wiki-like collaborative archiving software; I’m just not sure what it’s about yet. So I’m focusing on the email archiving thing I’ve got going: it’s aim is to produce printable (nicely-typeset, i.e. LaTeX) archives of email correspondence. The difference between this and just printing emails is that it stores the _structure_ of the email — date, body (without old replies; they’re stored as other emails in the system), and relational IDs for sender and receiver — rather than just flat text, and so the printed output can be much more readable and use less paper. If that makes any sense; I’m working on a better explanation….