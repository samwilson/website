---
id: 1929
title: How to kill WordPress
date: 2011-09-14T18:55:10+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1929
permalink: /2011/09/14/anti-wp/
views:
  - "534"
categories:
  - Programming
tags:
  - .htaccess
  - Blogging
  - databases
  - migrating
  - SQL
  - wordpress
---
(Other than mis-capitalising its ‘P’, that is.)

I have had a wordpress site (see, I’m failing even to give it a capital ‘W’ now) for many years, since about… umm… November 3<sup>rd</sup> 2003 at 16:01:23 or thereabouts. I’m finally sick of it. It’s grown and grown and is trying so hard to be everything to every blogger out there, that I don’t know where I stand with it. It used to be _fun_, y’know?! A codebase I could fiddle with, and make do whatever I wanted. Now, I just find it _very good_ for doing things that I _don’t need to do_.

So, I’m dumping it. No more WordPress.

Now the question is: how to migrate away from it? The important thing (although, really, I’m not _actually_ that fussed about it; it’s more a pride thing — a web geek hardly wants to go against Tim BL’s advice, does he?) is to preserve URIs, at least the important ones.

So I started by making a final backup — all files, WP core included, and the database dump — and moving that tarball out of my usual backup rotation. So I’ve got a snapshot of the site, that will never fall off the far end of my backups. You never know (to quote Duane Dibbley).

Then, I inserted all of the WP posts into my new system’s database::

```
INSERT INTO journal_entries (id, title, date_and_time, entry_text)
  SELECT id+1000, post_title, post_date, post_content
    FROM wp_posts
    WHERE post_type = 'post' AND post_status = 'publish'
    ORDER BY post_date ASC
```

The +1000 on the ID was to ensure that I could refer to the new IDs of the imported posts in the next section, the redirections (there were fewer than 1000 records already in the `journal_entries` table)::

```
SELECT CONCAT(
    'Redirect permanent /',
    YEAR(post_date),'/',
    LPAD(MONTH(post_date),2,'0'),'/',
    LPAD(DAY(post_date),2,'0'),'/',
    post_name,' ',
    'http://samwilson.id.au/journal/view/',
    id+1000
  ) AS redirection
  FROM wp_posts
    WHERE post_type = 'post' AND post_status = 'publish'
    ORDER BY post_date ASC
```

And I dumped all that into `.htaccess`.