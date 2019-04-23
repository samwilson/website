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
I have arrived at long last! I&#8217;ve been in WA for two weeks already, and I have only in the last couple of days a) been for a swim, and b) unpacked my tools and started to think (once again) about wood. I&#8217;ve been more concerned, for some reason, about getting a job, or working on porting my email archiving software to Java &#8212; now I&#8217;m back! Back in WA, and back at the workbench!

There are now a myriad projects that need my attention, and I just need to sort out in what order I&#8217;ll tackle them: I need _shelves_, that&#8217;s pretty high on the list; before I get get going on them, however, I need (well, maybe don&#8217;t _need_, but it&#8217;d be nice) somewhere to sharpen my tools, a bench that can get wet; I&#8217;d get going with that, then, but I&#8217;d like first to have just a couple of simple saw horses to have nearby to dock longer lengths of timber and whatnot. So that&#8217;s where I&#8217;m going to start:

[<img src="http://samwilson.id.au/wp-content/uploads/2008/07/sawstool_notes-500x332.jpg" alt="" title="Sawstool Notes" width="500" height="332" class="aligncenter size-medium wp-image-229" srcset="https://samwilson.id.au/wp-content/uploads/2008/07/sawstool_notes-500x332.jpg 500w, https://samwilson.id.au/wp-content/uploads/2008/07/sawstool_notes-150x99.jpg 150w" sizes="(max-width: 500px) 100vw, 500px" />](http://samwilson.id.au/wp-content/uploads/2008/07/sawstool_notes.jpg)

And yes, to figure out the angles I had to resort to PHP &#8212; I really aught to get myself a calculator that can do trig stuff&#8230;

<p style="text-align:center">
  * * *
</p>

On the IT front: I am as intent as ever to get working on some sort of wiki-like collaborative archiving software; I&#8217;m just not sure what it&#8217;s about yet. So I&#8217;m focusing on the email archiving thing I&#8217;ve got going: it&#8217;s aim is to produce printable (nicely-typeset, i.e. LaTeX) archives of email correspondence. The difference between this and just printing emails is that it stores the _structure_ of the email &#8212; date, body (without old replies; they&#8217;re stored as other emails in the system), and relational IDs for sender and receiver &#8212; rather than just flat text, and so the printed output can be much more readable and use less paper. If that makes any sense; I&#8217;m working on a better explanation&#8230;.