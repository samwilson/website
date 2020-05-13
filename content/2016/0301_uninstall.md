---
id: 2524
title: Uninstalling WordPress plugins in PHPunit
date: 2016-03-01T09:04:07+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2524
permalink: /2016/03/01/uninstall/
categories:
  - Programming
tags:
  - lab notebook
  - Tabulate
  - wordpress
---
There’s a problem with uninstalling Tabulate.

<pre lang="text">Fatal error: Class 'WordPress\Tabulate\DB\Grants' not found
in C:\work\public_html\wp\stage\wp-content\plugins\tabulate\uninstall.php on line 8
</pre>

The `uninstall.php` file shouldn’t know anything about the actual plugin. It shouldn’t use any classes or functions from the plugin itself.

This problem should have been caught before now, though, because the tests all run `uninstall.php` in their `tearDown()` function. The reason they don’t is that the Tabulate classes are still available at that point.

Perhaps it’s a matter of removing the autoloader? In the `tearDown()` function:

<pre lang="php">$autoloader = require __DIR__.'/../vendor/autoload.php';
$autoloader->unregister();
</pre>

But no, then the autoloader isn’t loaded for the next test. So can we re-enable it in `setUp()`? Yes, but that still doesn’t make it fail on the classes used in `uninstall.php`… I’m not sure why not.

Is there anything wrong with just including `autoload.php` in `uninstall.php`? No, I thought not.

That was easy.