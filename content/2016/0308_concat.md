---
id: 2541
title: Spaces around dots
date: 2016-03-08T14:33:53+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2541
permalink: /2016/03/08/concat/
categories:
  - Programming
tags:
  - coding standards
  - PHP
  - strings
  - wordpress
---
One of the first odd things that one finds when starting to work with WordPress code is the excessive use of spaces. Something like:

<pre lang="php">do_something('Words of '.$widget->noun($attrs['ish']));</pre>

becomes the the stretched out:

<pre lang="php">do_something( 'Words of ' . $widget->noun( $attrs['ish'] ) );</pre>

Which is fine, and actually now I’ve been using it for a decade I’m pretty comfortable reading it. But it’s uncommon in the PHP world. (And note the singular place in which spaces aren’t used: the array key, iff it’s a string.)

Not only that, but I just recently realised that the PHP CodeSniffer [sniffs for WordPress](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/) don’t actually check for the spaces around the concatenation operator. I’ve filed [an issue](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/issues/535) for that.