---
id: 1181
title: rsync.net
date: 2012-07-22T14:00:16+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1181
permalink: /2012/07/22/rsync/
views:
  - "4832"
categories:
  - Programming
tags:
  - backups
  - cloud storage
  - Linux
  - offsite
  - rsync.net
  - Subversion
  - svn
---
I signed up for an [rsync.net](http://rsync.net) account a bit over a month ago. They’re a reasonably-priced off-site filesystem provider, seemingly run by people who care about _security_ and _doing things normally_. By ‘normally’, I mean `rsync` for starters (oddly enough, given their name) but also the whole gammut of *nix-y ways of doing things; one can interact with them with the usual tools. So they provide a proper, old-fashioned filesystem, and protect it well (there’s even a [warrent](http://en.wikipedia.org/wiki/Warrant_canary "Wikipedia article about 'warrant canaries'") [canary](http://www.rsync.net/resources/notices/canary.txt "rsync.net's warranet canary, including up-to-date news headlines")). There’s a choice of datacentre — I chose the Zurich one — and plans ranging from 7GB (80c/GB/month) to 10TB (8c/GB/month). They even correspond via email, of all things! It really is odd that a company that behaves so _normally_ is so uncommon…. I don’t care about pretty graphics, boring and unused extra features, or ‘enterprise-readiness’ (whatever the flip that is), I just want a share of some disk in a big strong building somewhere, one that’s going to be protected and maintained properly and simply. All I can say so far is three cheers for rsync.net. (I’ll be sure to report back if my opinion changes.)

So that’s all well and good, and I’ve got my big disk in the sky, but _how_ am I going to use it? I am going to host a Subversion repository there, to serve as an everything-bucket. That is all. How well will `svn` handle a huge (multi-gigabyte) repository? I’ve heard varying reports, but most seem to think it’ll be fine. Certainly it’s data-copying system will work well, as far as resuming aborted connections goes (it’ll only copy what’s not yet been copied; much as rsync.net does (although I don’t think it does it at any smaller unit than that of the whole file)). Questions remain about how much overhead diskspace I’ll waste by doing this, but as most of the binary files will only be modified at most once or twice, and generally not at all once they’re checked-in, I don’t think it’ll matter too much.

I’ll see how things go.