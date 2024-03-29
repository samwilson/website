---
id: 2555
title: Running tests on WordPress coding standards
date: 2016-03-09T08:49:04+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2555
permalink: /2016/03/09/phpcs/
categories:
  - Programming
tags:
  - coding standards
  - phpcs
  - phpunit
  - wordpress
---
The [docs](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/blob/develop/CONTRIBUTING.md#unit-testing) for WordPress-Coding-Standards assume that one is installing things globally, but I don’t like my hacking on phpcs to break my usage of it elsewhere, so I wanted to cordon things off in their own little dev area. This is how.

Clone the two required repositories to directories next to each other:

```
cd ~/public_html/wordpress/
git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git
git clone https://github.com/squizlabs/PHP_CodeSniffer.git
```

Mostly you’ll be working from the PHP_CodeSniffer side of things. Change into that directory and set up its dependencies:

```
cd PHP_CodeSniffer
composer install
```

Set up `phpcs` so that it can find its tests and the WordPress coding standards:

```
cp phpunit.xml.dist phpunit.xml
./scripts/phpcs --config-set installed_paths ../WordPress-Coding-Standards/
```

And now you’re ready to run the tests (still from the PHP_CodeSniffer directory):

```
./vendor/bin/phpunit --filter WordPress
```
