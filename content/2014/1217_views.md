---
id: 2203
title: Including views in Drupal modules
date: 2014-12-17T09:23:20+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2203
permalink: /2014/12/17/views/
views:
  - "243"
categories:
  - Programming
tags:
  - Drupal
  - exporting
  - Features
  - lab notebook
  - modules
  - Views
---
Views are included in modules by implementing `hook_views_api()` and `hook_views_default_views()` and returning an array of `view` objects from the latter.

The easiest way to construct the view object is to create the desired view via the UI and then export it, saving each exported view into its own function in `sites/all/modules/custom/modulename/<dfn title="Replace with the correct module name">modulename</dfn>.views_default.inc` and then returning them all in `<em>modulename</em>_views_default_views()` in the same file (named e.g. `_<em>modulename</em>_views_<em>view_name</em>()`). For example:

<pre lang="php">/**
 * Implements hook_views_default_views().
 */
function worksmanagement_views_default_views() {
  return array(
    'work_orders' => _worksmanagement_views_work_orders(),
    'job_reports' => _worksmanagement_views_job_reports(),
  );
}
</pre>

All of which is good, and works well. (Why not use [Features](https://www.drupal.org/project/features) for this, which more or less does exactly the same thing? Not sure; probably stubbornness. That doesn’t matter for now though.) The confusion comes with updating the exported views.

When a view is created, its definition lives in the `views_view` and `views_display` database tables. Once the view has been exported and saved into the module, its definition is stored in _two_ places! This can be seen in the Views admin screen, where (once the caches have been cleared) the view is shown as &#8220;Database overriding code&#8221; rather than &#8220;In database&#8221;. There will also no longer be an option of deleting it; rather, it can be _reverted_. Reverting a view will delete its metadata from the two DB tables, and it will be defined exclusively from the module’s code. This is good.

The next step is to edit the view, make some changes, and re-export it. _Do not save it!_ There is no need to save the changes you make (as this would then stick it back into the database and you’d just have to revert it again), but rather just use the export function available from the view editing UI under the _edit view name/description_ menu (see screenshot below). This will export the view as it stands (i.e. in its unsaved, editing state).

<img src="http://samwilson.id.au/wp-content/uploads/2014/12/export.png" alt="Screenshot of View export menu item" class="aligncenter" style="width:100%" />

After exporting and overwriting the code in `_<em>modulename</em>_views_<em>view_name</em>()`, clearing the cache is all that’s required to make the view active and update to date with what’s in the module’s code.

Note that the view will be locked for editing; hit ‘cancel’ to unlock it, or break the lock when prompted when next editing the view.

_(This is why I don’t want to use Features for this: it feels better to have everything living in the module, rather than having to copy (or ‘revert’ as Features calls it) view definitions from the module into the database.)_