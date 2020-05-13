---
id: 2192
title: Taxonomy is good after all
date: 2014-12-05T08:53:39+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2192
permalink: /2014/12/05/taxonomy/
views:
  - "216"
dsq_thread_id:
  - "3829990309"
categories:
  - Programming
tags:
  - Drupal
  - entities
  - lab notebook
  - taxonomy
---
I was perhaps too hasty to dismiss Drupal’s taxonomy system. It is perhaps good to make this distiction between ‘content’ nodes and ‘metdata’ nodes; why create ‘content types’ for data that isn’t content?

So I need a new rule… perhaps it’s to do with frequency of updates and inserts? So that any entity whose records are not regularly updated or created should be thought of as non-content, and use the Taxonomy constructs.

A Book content type, for instance, might have a field for Binding Type which ten years ago we set to Hardcover, Paperback, and Magazine (or whatever… those are not great examples, but for a home library perhaps representative). Now we add Ebook also, but really that’s the limit of the modifications. Under the bare-bones Drupal paradigm with no taxonomy, one would create a Binding Type content type, and create only three nodes in it. Such foolishness! Better to create a new vocabulary.