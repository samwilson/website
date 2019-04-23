---
id: 996
title: Getting sorted for the new year, in the Mocca Lounge
date: 2011-12-31T10:17:03+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=996
permalink: /2011/12/31/mocca-lounge/
views:
  - "349"
categories:
  - Programming
tags:
  - cycling
  - digitisation
  - files
  - filesystems
  - Mocca Lounge
  - nomenclature
  - organisation
---
A new cafe, on the way home from a ride this morning: the _Mocca Lounge_, it seems to be called. I guess they mean brown and not quite one thing nor another, but at least relaxing. It&#8217;s a reasonable place to sit for a while and read a book. It&#8217;s an inside cafe with no windows (can you believe such a thing?!), but it is at least dim and carpeted and large and mostly empty, which are good things. And I&#8217;ve a coffee and a book and time, which are also good things.

So, three cheers for all that, then.

I&#8217;ve been sorting out a new filesystem nomenclature, these last few months&#8230;

  1. The top level (my home directory, `/home/sam`) contains one directory per year and `~/tmp`, and a pile of other stuff, as usual, but that&#8217;s all maintained by various programmes and the OS.
    
    <pre>~/
    1995/
    1996/
    &hellip;
    2011/
    2012/
    tmp/
</pre>

  2. Each year has only a single level below it, topically- and old-fashionedly-named to maintain alphabetical sorting:
    
    <pre>2011/
        Subject, clarification/
        Subject, andother aspect of it/
        Another subject/
        Again, something else/
</pre>
    
    There are no files at that level, only directories.</li> 
    
      * At the turn of the year, items which are of continuing activity are moved to the new year. All else stays put. This means that the current year only ever contains things that are useful and whatever is old but still needs to be kept—and which will rarely be looked at—disappears out of sight in the old years.
        
        I&#8217;ve always found it annoying that computer organisation systems don&#8217;t allow things to moulder away in boxes in sheds (as it were), instead forcing everything to be current and visible — and thus liable thrown away once no longer useful. A core part of my archival system is to hide things from my own penchant for disposal.</li> 
        
          * Within each item, and within the `tmp` directory, there is no prescribed ordering. Files take whatever names and arrangements as seem suitable.
        
          * File and directory names contain whatever characters they want, with the exception of quotation marks, slashes, colons, asterisks, octothorpes, and anything else I think is likely to be annoying in scripts, moving between filesystems, or other filename handling.
        
          * [There is no rule six.](http://youtu.be/_f_p0CgPeyA?t=2m26s) `:-)`</ol>