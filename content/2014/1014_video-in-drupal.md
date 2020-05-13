---
id: 2146
title: Video in Drupal
date: 2014-10-14T08:25:28+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2146
permalink: /2014/10/14/video-in-drupal/
views:
  - "316"
categories:
  - Programming
tags:
  - Drupal
  - lab notebook
  - video
---
**tl;dr:** Drupal is good with the Video and Flowplayer modules. Install them with `drush -y en video flowplayer` and just make sure you’re testing with a video file that isn’t broken!

* * *

I’m trying to create a very simple video library in Drupal. Just a single Content Type with a bunch of fields, one of which should be for uploading a video.

The [Video module](https://www.drupal.org/project/video) looks to be the first choice. It creates a field type, and sets up a system for re-encoding. Sensible.

So I install it: `drush -y en video`

Then set up a transcoder by installing [FFmpeg](http://ffmpeg.org/) and telling Drupal where to find it. Also a _Preset_, which groups together output details like file extension, codec, sizes, and a bunch of other details—most of which I left as given.

Probably silly, as when I try to upload an MP4 ([one of these](http://support.apple.com/kb/ht1425)) I get: &#8220;The video conversion process has failed. You might want to submit a simpler video format like _mpeg_ or _divx avi_.&#8221; So why can’t I just upload a simple mpeg and have it displayed without being re-encoded?

The video field settings have an option, &#8220;Enable auto video conversion&#8221;, which I turn off. This works: I can upload the MP4 and it’s thumbnail is displayed at a nice size and things sort of start to look like a video player… but sadly emblazoned with &#8220;No video with supported format and MIME type found.&#8221; Oh well, maybe a different player is needed (I was relying on the standard HTML5 player).

Installing the [Flowplayer module](https://www.drupal.org/project/flowplayer) helps a bit: now there’s a video player with controls and a spinning loader—but the same MIME type error as before. Switching the MP4 player to ‘FLV Flash Players’ (from ‘HTML5 Player’) is a bit great: now there is a player, and it plays the file… audio only though, no video.

I tried another video though, and all works correctly! So that’s nice.