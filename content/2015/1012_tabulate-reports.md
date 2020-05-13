---
id: 2410
title: '‘Reports’ in Tabulate'
date: 2015-10-12T07:51:13+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2410
permalink: /2015/10/12/tabulate-reports/
categories:
  - Programming
tags:
  - databases
  - queries
  - Tabulate
  - templates
  - Twig
  - wordpress
---
I’ve been working on a system for integrating custom _queries_ and _outputs_ into [Tabulate](https://wordpress.org/plugins/tabulate/). So far, it’s only been possible to use MySQL views to combine data from different tables, and the output has been just the same as for base tables. I keep wanting to be able to apply custom formatting to columns or to whole tables — the data is fine, it can almost always be derived with a single SQL statement.

Currently, I’m working on a system of ‘reports’, where one can define a template (using Twig) and a set of SQL queries whose data will be given to the template. Pretty simple, really. I thought about (actually, still wonder if it’s not a better way) making it possible to define custom formats/templates for individual columns and column types, but everything that that approach can do can be done with these ‘reports’, plus a whole lot more.

So, a report (a record in the `<em>$prefix</em>_tabulate_reports` table) has a title, description, and a Twig template. Then it has a set of SQL queries (in the `<em>$prefix</em>_tabulate_report_queries` table), each of which has a name (which is what the query is passed into the template as).

It’s hard to know if this is enough. It might even be too much — Tabulate is not meant to be anything more than a CRUD tool, and customisation above and beyond what it does can easily be handled with custom plugins. It does seem that it’s worth making Tabulate able to do some basic display-customisation though, so that site authors can more easily work with data without having to write any custom code.

Because that’s really the goal of Tabulate: it should provide simple ways to work with tabualar data within WordPress in much the same way that spreadsheet programes do on the desktop (well, that’s perhaps a bit of an overstatement, considering the crazy things that people do with spreadsheets). It should easily insert a list of statistics into a post; or add an always-up-to-date chart to a page; or invite submissions of data points from registered users; and generally make it _easier_ (than spreadsheets do) to enforce referential integrity, proper data types, and other essential constraints.