---
title: Preventing duplicate rows in a tabular HTML form
date: 2011-07-12 15:41:00 +0800
timezone: Australia/Perth
---
I am working on a bespoke issue-tracking system at the moment
(*not* for code issue-tracking, in case anyone thinks we're cloning
[Redmine](http://www.redmine.org/); although there certainly are overlaps...)
in which each issue has a list of personnel, each of whom have a role on the issue.

The task at hand is to prevent people selecting the same combination of role and person
more than once. Of course, the application and database will reject such an occurence;
this is to fix the UI so that users can't easily submit the duplicates.
For the purposes of this explanation, we're working only in HTML and Javascript (jQuery).

The UI looks something like the screenshot below
(there is also a means of adding new rows to the table
— that doesn't change how this validation works,
but it is why we're using [`.live()`](http://api.jquery.com/live) here):

<img src="http://samwilson.id.au/wp-content/uploads/2011/06/select_boxes.png" 
alt="" title="select_boxes" width="162" height="148" class="alignright size-full
 wp-image-820" srcset="https://samwilson.id.au/wp-content/uploads/2011/06/select_boxes.png 
 162w, https://samwilson.id.au/wp-content/uploads/2011/06/select_boxes-150x137.png 150w" 
 sizes="(max-width: 162px) 100vw, 162px" />

## The Problem

In an HTML table full of form elements,
  
where new rows can be added (dynamically),
  
we want to prevent duplicate rows being selected.

## The Plan

After changing a value in any row,
  
get a list of the values in that row
  
and then go through all of the rows
  
and see if those values are there.
  
If we find more than one instance of them,
  
tell the user
  
and return the changed value to what it was before.

## The Solution

The final code is below (it was built using jQuery 1.6.1 and jQuery UI 1.8.5),
and a [demonstration is available elsewhere](/wp-content/uploads/2011/07/tabular-forms/demo.html).
