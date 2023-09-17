---
id: 2149
title: Features (my cheatsheet)
date: 2014-11-18T13:07:39+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2149
permalink: /2014/11/18/features/
views:
  - "292"
categories:
  - Programming
tags:
  - deployment
  - development
  - Drupal
  - drush
  - Features
  - production
---
The Features module is great. I _think_. Sometimes it seems too good to be true… usually it just is good though.

One can build a site in one’s local Drupal installation, and then piece by piece export its definition to a feature module that can be put under version control and deployed to other sites in one fell swoop. Start with:

```
drush fe --version-set=7.x-0.1 --destination=sites/all/modules/custom/featurename featurename components
```

where `featurename` is the new module’s name and `components` is the first thing to export (usually a content type). From then, the destination can be left out, and the components definition is also pretty flexible at making it quicker to select which components to export (naming contentions, such as common prefixes, help with this). So, as the site progresses, export new components to the feature: 

```
drush fe --version-increment featurename components
```

If a component that’s already been exported needs to be changed, just change it and then _update_ the feature with:

```
drush fu --version-increment featurename
```

That’s about all there is to the construction phase. Stick the `sites/all/modules/custom/featurename` directory into a VCS. Then it’s deployment time…

***

Check the `featurename` module out to the staging site (in the custom directory still, just for clarity’s sake) and enable the module:

```
drush en featurename
```

That only needs to be done the first time; subsequent updates are just cycles of updating the code and _reverting_ the feature (a note on the slightly-confusing terminology of Features: one _reverts_ (`fr`) the site, or _updates_ (`fu`) the code).

```
$ git pull origin master
$ drush fr featurename
```
