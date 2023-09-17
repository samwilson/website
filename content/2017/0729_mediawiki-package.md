---
id: 2879
title: Jazz and the MediaWiki package
date: 2017-07-29T07:58:44+00:00
author: Sam Wilson
layout: post
guid: https://samwilson.id.au/?p=2879
permalink: /2017/07/29/mediawiki-package/
categories:
  - Programming
tags:
  - MediaWiki
  - software
  - system administration
  - ubuntu
---
And rain, I mustn’t forget the rain. I’m worrying about the roof, although far less than I used to (it’s a different roof). The jazz is the radio; it’s on.

But the main point this morning is exploring the [mediawiki-lts](https://launchpad.net/~legoktm/+archive/ubuntu/mediawiki-lts) package [maintained](https://meta.wikimedia.org/wiki/User:Legoktm/Packages) by Legoktm. I’ve been meaning to look at it for a while, and switch my (non-playground) wikis over to it, but there’s never enough time. Not that there’s enough time now, but I’m just trying to get it running locally for two wikis (yes, the smallest possible farm).

So, in simple steps, I first added the PPA:

```
sudo add-apt-repository ppa:legoktm/mediawiki-lts
```

This created `/etc/apt/sources.list.d/legoktm-ubuntu-mediawiki-lts-xenial.list`. Then I updated the package info:

```
sudo apt-get update
```

And installed the package:

```
sudo apt install mediawiki
```

At this point, the installation prompt for MediaWiki 1.27.3 was available at http://localhost/mediawiki/ (which luckily doesn’t conflict with anything I already had locally) and I stepped through the installer, creating a new database and DB user via phpMyAdmin as I went, and answering all the questions appropriately. (It’s actually been a while since I last saw the installer properly.) The only tricky thing I found was that it asks for the “Directory for deleted files” but not for the actual directory for _all_ files — because I want the files to be stored in a particular place and not in `/usr/share/mediawiki/images/`, especially as I want there to be two different wikis that don’t share files.

I made a typo in my database username in the installation form, and got a “Access denied for user x to database y” error. I hit the browser’s back button, and then the installer’s back buttons, to go back to the relevant page in the installer, fixed the typo and proceeded. It remembered everything correctly, and this time installed the database tables, with only one error. This was “Notice: JobQueueGroup::__destruct: 1 buffered job(s) of type(s) RecentChangesUpdateJob never inserted. in /usr/share/mediawiki/includes/jobqueue/JobQueueGroup.php on line 447”. Didn’t seem to matter.

At the end of the installer, it prompted me to download LocalSettings.php and put it at `/etc/mediawiki/LocalSettings.php` which I did:

```
sudo mv ~/LocalSettings.php /etc/mediawiki/.
sudo chown root:root /etc/mediawiki/LocalSettings.php
sudo chmod 644 /etc/mediawiki/LocalSettings.php
```

And then I had a working wiki at `http://localhost/mediawiki/index.php`!

### Configuring

I wanted a different URL, so edited `/etc/apache2/sites-available/000-default.conf` (in order to not modify the package-provided `/etc/mediawiki/mediawiki.conf`) to add:

```
Alias /mywiki /var/lib/mediawiki
```

And changed the following in `LocalSettings.php`:

```
$wgScriptPath = "/mywiki";
```

The multiple wikis will have to wait until later, as will the backup regime.
