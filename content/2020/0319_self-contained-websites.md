---
title: Self-contained websites
date: 2020-03-19 07:34:00 Z
location: Fremantle
timezone: Australia/Perth
tags:
  - MediaWiki
  - wikis
  - Wikimedia Commons
---
It's Friday afternoon (nearly beer o'clock) at the end of this first week of everyone working from home and all the events being postponed.
It's strange, but not that strange from the point of view of someone (me) who already works from home and doesn't really go to many things in person.
I am missing the Riff coworking space and Thursday night meetups in Perth, but there's something nice about having an empty calendar.
Actually, my calendar is more full than ever, with lots of new online meetings; which is great (the ones that are interesting are great, anyway).

Anyway, the point of this post is that I'm pondering how a MediaWiki installation can reinforce the self-contained nature of a website.
Because it doesn't support hotlinking images or embedding off-site things like Twitter cards, it means that all text and resources required are kept in the wiki.
This means nothing gets lost as a result of *other* people changing their sites (or, rather, *everything* or nothing gets lost, because wikis do go off the air often enough).
I like this attribute of MediaWiki. It's super annoying sometimes, but it makes for more robust websites,
that can be archived wholesale and restored down the track in their entirety.

One key way that self-containment is broken is with [InstantCommons](https://www.mediawiki.org/wiki/InstantCommons),
because files included from Commons can be deleted there and the local wiki would never know.
There are some ways around that, and I've been meaning to see what it'd take to get the *Commons Deletion Notification Bot* working on 3rd party wikis,
but it is at least a single point of failure. One workaround is to make sure every Commons file used on a wiki is on ones watchlist on Commons.
On my own wiki, I have InstantCommons turned off — because I used to use it a fair bit, but then something happened and I got grumpy about it and turned it off.
Now I copy some things across (with appropriate attribution and linking, of course),
and am generally happier knowing that the pages here are not going to be broken when other people change things elsewhere.
