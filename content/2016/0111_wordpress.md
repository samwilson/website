---
id: 2469
title: WordPress (not Laravel) as an app framework
date: 2016-01-11T09:28:06+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2469
permalink: /2016/01/11/wordpress/
categories:
  - Programming
tags:
  - applications
  - frameworks
  - plugins
  - Programming
  - wordpress
---
Is it a good idea to develop full-blown applications as plugins inside WordPress (or an other CMS)? I sometimes feel like it’s a silly thing to do. Especially if the application is not really doing anything to extend or complement the standard functions of the CMS, and is just existing as a stand-alone creature within it.

In WordPress, for instance, lots of things can be done by creating new post types: a plugin for tracking books and authors could have two new post types for those entities, and we would attach whatever metadata is required. Or alternately, a few new database tables could be created, and the book-managing plugin could do things directly with them and completely ignore the standard post functionality. The latter would mean other common features of filtering and things wouldn’t apply, but then that’s often just as it should be when we need full control over how an application behaves.

Basically, I sometimes only really use WordPress as a framework for:

  1. user authentication and authorisation;
  2. installation and upgrade;
  3. a theming/skinning system;
  4. internationalisation;
  5. familiar UI for users;
  6. the front-end/back-end dicotomy.

And that’s it. Everything else is within the plugin. See how it feels a bit silly?

However, it means that a plugin-application _does_ have the things listed above (for no effort on my part), and it also gets what it perhaps the most important reason that I go this route: the WordPress community.

So I’ll carry on being silly.