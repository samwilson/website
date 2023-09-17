---
title: Tabulate 1.0.0
date: 2015-07-23 14:04:17 +0800
timezone: Australia/Perth
tags:
  - Programming
  - data
  - maps
  - MySQL
  - OpenStreetMap
  - plugins
  - Tabulate
  - versioning
  - wordpress
---
I’ve just released version 1.0.0 of [Tabulate](https://wordpress.org/plugins/tabulate/),
a WordPress plugin for working with data in a site’s MySQL database.
I’ve been using it for a few months in production, and the shift from [0.* to 1.0](http://semver.org/) was fairly arbitrary
— it just seemed stable enough now. The new feature that got included in this release
is the ability to export to OpenStreetMap XML (not a great leap ahead of the KML export that was already done).

Any problems with Tabulate can be lodged on the [issue tracker](https://github.com/tabulate/tabulate/issues) at Github,
or on the normal WordPress support forum.

Here’s a suburb’s worth of power pole locations, exported from Tabulate and opened in [JOSM](https://josm.openstreetmap.de/):

![Poles in Hamilton Hill.](/2015/0723_hamilton-hill-poles.png)
