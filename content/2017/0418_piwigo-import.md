---
id: 2530
title: Importing to Piwigo
date: 2017-04-18T09:15:49+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2530
permalink: /2017/04/18/piwigo-import/
categories:
  - Open content
tags:
  - files
  - importing
  - photographs
  - Piwigo
  - rsync
  - SFTP
  - syncronization
---
Piwigo is pretty good!

I mean, I mostly use Flickr at the moment, because it is quick, easy to recommend to people, and allows photos to be added to [Trove](http://trove.nla.gov.au/). But I’d _rather_ host things myself. Far easier for backups, and so nice to know that if the software doesn’t do a thing then there’s a possibility of modifying it.

To bulk import into Piwigo one must first rsync all photos into the `galleries/` directory. Then, rename them all to not have any unwanted characters (such as spaces or accented characters). To do this, first have a look at the files that will fail:

    find -regex '.*[^a-zA-Z0-9\-_\.].*'

(The regex is determined by `$conf['sync_chars_regex']` in [include/config_default.inc.php](https://github.com/Piwigo/Piwigo/blob/master/include/config_default.inc.php) which defaults to `^[a-zA-Z0-9-_.]+$`.)

Then you can rename the offending files (replace unwanted characters with underscores) by extending the above command with an exec option:

    find -regex '.*[^a-zA-Z0-9\-\._].*' -exec rename -v -n "s/[^a-zA-Z0-9\-\._\/]/_/g" {} \;

<small>(I <a href="http://piwigo.org/forum/viewtopic.php?id=9789">previously used</a> a more complicated for-loop for this, that didn’t handle directories.)</small>

Once this command is showing what you expect, remove the `-n` (“no action”) switch and run it for real. Note also that the second regex includes the forward slash, to not replace directory separators. And don’t worry about it overwriting files whose normalized names match; rename will complain if that happens (unless you pass the `--force` option).

Once all the names are normalized, use the [built-in synchronization feature](http://piwigo.org/doc/doku.php?id=user_documentation:learn:add_picture#by_ftp) to update Piwigo’s database.

At this point, all photos should be visible in your albums, but there is one last step to take before all is done, for maximum Piwigo-grooviness. This is to use the [Virtualize plugin](http://piwigo.org/ext/extension_view.php?eid=511) to turn all of these ‘physical’ photos into ‘virtual’ ones (so they can be added to multiple albums etc.). This plugin comes with a warning to ensure that your database is backed up etc. but personally I’ve used it dozens of times on quite large sets of files and never had any trouble. It seems that even if it runs out of memory and crashes halfway, it doesn’t leave anything in an unstable state (of course, you shouldn’t take my word for it…).