---
id: 2181
title: Drupal terminology vs old-fashioned DB words
date: 2014-12-04T12:38:45+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2181
permalink: /2014/12/04/words/
views:
  - "210"
categories:
  - Programming
tags:
  - databases
  - Drupal
  - terminology
  - words
---
Drupal’s entity model is pretty confusing if one is used to the strict world of ‘proper’ RDBMSs, but it does start to make sense after a while. It’s best to just forget about all the cruft that comes with the standard installation, and work with the base functionality (and some that’s currently provided by modules but seems will be in D8 core).

Taxonomy, for instance, provides a subset of the functionality that can be built with entity references (a.k.a. foreign keys in the relational model, except there’s no integrity!).

The commenting system (which is also in core) can be constructed with basic Drupal things like content types, views, blocks, and rules.

Same goes for Book pages. Everything, really.

(At least, this is my current thesis; an attempt to reduce the number of modules I have to get my head around to under a thousand…)

Basically one needs to just know of the following:

<table>
  <tr>
    <th>
      Database term
    </th>
    
    <th>
      Drupal equivalent (sort of)
    </th>
  </tr>
  
  <tr>
    <td>
      Table
    </td>
    
    <td>
      Content (or Node) Type
    </td>
  </tr>
  
  <tr>
    <td>
      Row
    </td>
    
    <td>
      Node
    </td>
  </tr>
  
  <tr>
    <td>
      Column
    </td>
    
    <td>
      Field
    </td>
  </tr>
  
  <tr>
    <td>
      Foreign key
    </td>
    
    <td>
      Entity reference field
    </td>
  </tr>
  
  <tr>
    <td>
      View
    </td>
    
    <td>
      View
    </td>
  </tr>
  
  <tr>
    <td>
      Enum field type
    </td>
    
    <td>
      <code>list_text</code> field type
    </td>
  </tr>
  
  <tr>
    <td>
      Boolean field type
    </td>
    
    <td>
      <code>list_boolean</code> field type
    </td>
  </tr>
  
  <p>
    <!--

<tr>

<td></td>



<td></td>

</tr>

-->
    
    <br /> </table>