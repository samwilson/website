---
title: Manually upgrading Piwigo
date: 2016-12-15 16:44:00+08:00
tags:
  - programming
  - photos
  - Piwigo
  - upgrading
  - websites
---
There’s a [new version](http://piwigo.org/forum/viewtopic.php?id=27065) of [Piwigo](http://piwigo.org/) out, and so I must [upgrade](http://piwigo.org/basics/upgrade_manual). However, I’ve got things installed so that the web server doesn’t have write-access to the application files (as a security measure), and so I can’t use the built-in automatic upgrader.

I decided to switch to using Git to update the files, to make future upgrades much easier and without having to make anything writable by the server (even for some short amount of time).

First lock the site, via _Tools > Maintenance -> Lock gallery_, then get the new [code](https://github.com/Piwigo/Piwigo):

```
$ git clone https://github.com/Piwigo/Piwigo.git photos.samwilson.id.au
$ cd photos.samwilson.id.au
$ git checkout 2.8.3
```

Copy the following files:

`/upload` (this is a symlink on my system)
  
`/local/config/database.inc.php`
  
`/local/config/config.inc.php`

The following directories must be writable by the web server: `/_data` and `/upload` (including `/upload/buffer`; I was getting an “error during buffer directory creation” [error](https://github.com/Piwigo/Piwigo/issues/279)).

Then browse to `/upgrade.php` to run any required database changes.

I’ve installed these plugins using Git as well: [Piwigo-BatchDownloader](https://github.com/mistic100/Piwigo-BatchDownloader), [Flickr2Piwigo](https://github.com/mistic100/Flickr2Piwigo), and [piwigo-openstreetmap](https://github.com/xbgmsharp/piwigo-openstreetmap). The OSM plugin also requires `/osmmap.php` to be created with the following (the plugin would have created it if it was allowed):

```
<?php
define( 'PHPWG_ROOT_PATH', './' );
include_once( PHPWG_ROOT_PATH . 'plugins/piwigo-openstreetmap/osmmap.php' );
?>
```

That’s about. Maybe these notes will help me remember next time.
