---
title: Facebook vs. WordPress
date: 2007-08-22T16:43:52+00:00
timezone: Australia/Canberra
tags:
  - Open content
  - archiving
  - Facebook
  - Placeblogging
  - politics
  - social networking
  - technology
---
The last few weeks have seen a great number of my friends turn to Facebook (and, of course, I know exactly how many). It’s great, it’s exciting, it’s suddenly become so easy to organise things and we can now all talk about [Facebook](http://facebook.com)when we meet for a coffee at the Front; however, all is _not_ as funky as one might seem…

Don’t misunderstand me here, I’m all in favour of using Facebook — I just don’t think it should be used for _everything_. It’s great as a procrastination tool, for example, or for stumbling across long-lost friends, or being sent lovely pictures like this:

![Picture: Sam got tapes for 35c.](2007/sam-got-tapes.png)

But Facebook is, despite their oh-so-wonderful API, a closed system. We’re all piling our (desperately interesting, I’m sure) personal information into it, and giving no thought to what will happen to that information in the future. I don’t neccessarilly mean the usual conspiracy theories of governmental data-harvesting or derranged stalkers (they probably apply to wherever one is one the web), but what about ideas of cultural artifact preservation? (I know, I know, no one cares…)

Much of Facebook replicates systems that we’ve been using for years. Why, for example, did they have to build their own private messaging system? What’s wrong with email? Could they not have made it all work together — maybe someone will build an IMAP webmail application for Facebook, and prove my objections aimless.

But that’s all beside the point: I’m a geek, and prefer to build my own. [An article](http://howto.wired.com/wiredhowtos/index.cgi?page_name=replace_facebook_using_open_social_tools;action=display;category=Live) in Wired started me off thinking about this, and since then I’ve been doing a bit of reading (eg. [SNIX](http://www.codeproject.com/useritems/SNIX.asp)), and here’s my skeleton thus far of a distributed, home-grown, open-source, social networking system:

* Start with a blog. I prefer [WordPress](http://wordpress.org),
  but the point of all this is that by using open standards it *really* doesn’t matter what software we use.
  Post whatever you want (images, movies, audio, anything) and enable comments on everything.
* Collect feeds. Most blogging tools come with in-built support for news feeds of some kind, usually at least [RSS](http://en.wikipedia.org/wiki/RSS)
  and [Atom](http://en.wikipedia.org/wiki/Atom_%28standard%29). Create a page on your blog and aggregate all of your friends’ feeds there.
* Post coming events. With a plugin like [Event Calendar](http://wpcal.firetree.net/) you can post future events,
  and produce a [iCalendar feed](http://en.wikipedia.org/wiki/ICalendar) to which your friends can subscribe.
  Add another page, to aggregate your friends’ events.

Unfortunately, that’s about where it ends. How does one have ‘Friends’ on a system that doesn’t mandate common software
— or common _anything_ save interchange formats?! I don’t know. Maybe Facebook _does_ rock after all…

But I do know that I’d rather be using my own software, with all content remaining under my control at all times;
the methods for sharing this with the world are maturing, and before long will be widespread and useable.
