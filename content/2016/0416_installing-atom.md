---
id: 2630
title: Installing AtoM
date: 2016-04-16T18:38:57+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2630
permalink: /2016/04/16/installing-atom/
categories:
  - Open content
tags:
  - Access to Memory
  - AtoM
  - Elasticsearch
  - installation
  - system administration
---
[Access to Memory](https://www.accesstomemory.org/) is a brilliant archival description management system, written in PHP and available under the CC-BY-SA license. The installation documentation is thorough… but of course I just want to get the thing running and so didn’t bother actually _reading_ it all! I mean, where’s the tldr</a>?!</p> 

So here are the essential bits (for a more-or-less bog standard Ubuntu install with Apache, PHP, and Node.js), running as a normal user and installing to a subdirectory.

To start, clone the repository from <https://github.com/artefactual/atom.git> and check out the latest stable branch (e.g. `stable/2.2.x`).

Then make the `config`, `cache`, and `log` directories writable by the web-server user: `chgrp -R <em>www-data</em> {cache,log,data}` (or whatever your webserver runs as, of course).

Now change into the `/plugins/arDominionPlugin` directory and run `make`; this will build the CSS files.

Navigating to the installation now will redirect to the installation system, and probably throw up a bunch of errors. Probably to do with missing dependencies, or permissions; sort these out (e.g. `sudo php5enmod xsl` and you should be good to go.

(Good to go to the next step, that is.)

Now install [Elasticsearch](https://www.elastic.co/products/elasticsearch). It’s easier than the AtoM docs admit: just do it the normal way with `sudo apt-get install elasticsearch`. (I’d submit a change to the AtoM docs to remove the “it’s not in the Ubuntu repositories” line, but I’m not quite sure how yet.)

Start Elasticsearch (in the background; the `-d` switch) with `sudox /usr/share/elasticsearch/bin/elasticsearch -d` and carry on with the installation procedure. The rest seems to be fairly straight forward.