---
id: 1393
title: When Apache invents filename extensions and /index = /index.php
date: 2013-01-07T15:59:13+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1393
permalink: /2013/01/07/multiviews/
views:
  - "1841"
categories:
  - Programming
tags:
  - Apache
  - index.php
  - MultiViews
  - PHP
  - servers
  - web
---
I have now had this problem about every year for the last three or four years, and every time have completely forgotten how I resolved it the previous time. It’s especially annoying, because usually involves searching for such common terms as `index.php`, `apache`, `directory`, etc. which result in almost entirely useless information.

So, here, for my own future reference, is how to stop a stupid Apache from serving `/index` as `/index.php` (at, of course, any depth of the path):

<pre lang="shell">Options -MultiViews
</pre>

So easy. The [documentation](https://httpd.apache.org/docs/2.2/content-negotiation.html#multiviews) explains it all.

I’ve just added it to the [WebDB .htaccess](https://github.com/samwilson/kohana_webdb/blob/master/htaccess.dist).

(I have since discovered that this [is](http://stackoverflow.com/questions/12590526/apache-see-index-as-index-php "Apache see index as index.php"), [of course](http://stackoverflow.com/questions/11216563/apache-2-treating-index-and-index-php-as-the-same-file "Apache 2 treating index and index.php as the same file"), already covered on StackOverflow.)