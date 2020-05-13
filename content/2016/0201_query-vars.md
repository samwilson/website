---
id: 2495
title: Be careful with GET parameter names in WordPress
date: 2016-02-01T14:46:17+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2495
permalink: /2016/02/01/query-vars/
categories:
  - Programming
tags:
  - plugins
  - Tabulate
  - wordpress
---
I’ve been getting confused about why an HTML form I’ve been building inside a WordPress shortcode has been getting redirected after submission. Turns out it was because I was using `p` as a name for a request variable, and that’s not allowed. It’s one of the names used by WordPress core; there are [a few dozen of them](http://codex.wordpress.org/WordPress_Query_Vars#Query_variables).

I switched to prefixing my form’s input names with the name of the plugin, and all is well.