---
title: Drupal terminology vs old-fashioned DB words
date: 2014-12-04T12:38:45+00:00
tags:
  - Programming
  - databases
  - Drupal
  - terminology
  - words
---
Drupal’s entity model is pretty confusing if one is used to the strict world of ‘proper’ RDBMSs, but it does start to make sense after a while.
It’s best to just forget about all the cruft that comes with the standard installation,
and work with the base functionality (and some that’s currently provided by modules but seems will be in D8 core).

Taxonomy, for instance, provides a subset of the functionality that can be built with entity references
(a.k.a. foreign keys in the relational model, except there’s no integrity!).

The commenting system (which is also in core) can be constructed with basic Drupal things like content types, views, blocks, and rules.

Same goes for Book pages. Everything, really.

(At least, this is my current thesis; an attempt to reduce the number of modules I have to get my head around to under a thousand…)

Basically one needs to just know of the following (database term followed by approximate Drupal equivalent):

* Table: Content (or Node) Type
* Row: Node
* Column: Field
* Foreign key: Entity reference field
* View: View
* Enum field type: `list_text` field type
* Boolean field type: `list_boolean` field type
