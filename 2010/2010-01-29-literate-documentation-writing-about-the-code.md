---
id: 498
title: 'Literate Documentation: Writing about the code'
date: 2010-01-29T10:45:27+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=498
permalink: /2010/01/29/literate-documentation-writing-about-the-code/
views:
  - "590"
categories:
  - Programming
tags:
  - documentation
  - Donald Knuth
  - javadoc
  - Literate Programming
---
This morning I’m returning to work on some code that I haven’t touched for a few months, and I’ve been rather dreading getting back to it. I’ve forgotten all the details; never knew many of them anyway. I was working with someone else on this, and so have to get my head around their work too. And of course, all I’m trying to do is modify one little (well, constrained to one package) part of the program.

How to not only get over this being an annoying chore, but actually get excited again about the program? Start at the top, read through all the [javadocs](http://java.sun.com/j2se/javadoc/index.jsp), read through the code, and as I go make the documentation better. Write the _story_ of the program — the narrative of the code. Documentation, in my view, should not only be useful and readable and thoroughly explain the code, it should actually be _interesting_ to read!

This is the essence, I feel, of [Literate Programming](http://en.wikipedia.org/wiki/Literate_programming). I know there was much more to [Knuth’s](http://en.wikipedia.org/wiki/Donald_Knuth) idea than verbose code commentary, but the idea of being able to sit down and read a clear human-language expository of a programme is very powerful. The documentation that is produced is a hypertext, but the nodes of it should be complete, interesting, explanations of how the code works and why it was written the way it was.