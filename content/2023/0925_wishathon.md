---
title: Wishathon notes
date: 2023-09-25 18:45:00
timezone: Australia/Perth
location: Fremantle
tags:
  - wikimedia
  - CommTech
---

Today at work was day one of the twice-yearly Community Tech wishathon.
It's a time when we try to work on smaller wishes, in the manner of a hackathon
(less rigorous planning, development, and QA, basically — and possibly, in my case, more beer).

Today I started to look into adding [favourite and recent templates](https://meta.wikimedia.org/wiki/Community_Wishlist_Survey_2023/Editing/Quickly_add_favorite_and_related_templates)
to TemplateWizard.
I found a [little bug](https://phabricator.wikimedia.org/T347258) with TemplateData, and a deprecation for which I made [a patch](https://gerrit.wikimedia.org/r/c/mediawiki/extensions/TemplateData/+/960232) (merged this evening).
I started working on the favouriting feature
but am so far a bit confused about where things should live:
there's a suggestion that the widget for looking up favourite templates should live in core
so that it can be used by TemplateWizard and VisualEditor,
but the look-up widget is only half of this
— the other thing is how to *save* one's favourites.
In the case of TemplateWizard I think that should be done via a heart icon near the link and close icons.
So perhaps the core code could have widgets for both of those things.

The idea I think is that it'll save the favourited and recently-selected template names
to a new hidden user preference.
It'd be a JSON object with two keys, `favourite` and `recent`, both being arrays of string template names.
There doesn't seem to be any other data about individual templates that it'd be good to save.

Tomorrow I'll dig more into these ideas, and look at whether the TemplateData extension would be a good place to have these widgets.
It feels to me like tagging templates as favourite/recent/etc. might be just the sort of thing that TemplateData should do.
Maybe it could even do featured templates? Hmm… does that mean this should be a more general preference,
with a site-wide config that matches it in structure?
