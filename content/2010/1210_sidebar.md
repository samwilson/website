---
id: 1617
title: 'WordPress: listing future posts in the sidebar'
date: 2010-12-10T15:30:09+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1617
permalink: /2010/12/10/sidebar/
views:
  - "462"
categories:
  - Programming
tags:
  - wordpress
---
Because I’m not really using WordPress much these days, not for development, I forget how to do simple things. Like putting a little list in the sidebar, of ‘scheduled’ posts (i.e. posts with a date greater than today’s).

The problem with this method is that the posts listed are not actually \*viewable\*, because they’re not actually \*published\* yet. This is what I was wanting — the idea being to announce events in the sidebar, and then, once they’ve passed, write them up as full posts (at which point, of course, they’ll be published).

<pre lang="php"><li class="widget-container">
  <h3 class="widget-title">
    Coming Events
  </h3>
  
  
  <?php query_posts('post_status=future&#038;category_name=events&#038;');
if (have_posts()): echo '<ul>'; while (have_posts()): the_post(); ?>
  
  
  <li>
    <?php echo get_the_date() ?>, 
    
    <?php the_time() ?>:
    
    
    <strong><?php the_title(); ?></strong>
    
    <?php the_meta(); ?>
    
  </li>
  
  
  <?php endwhile; echo '</ul>'; endif; ?>
  </pre>
  
  
  <p>
    Note that this also lists custom fields (“the_meta()“) under each item.
  </p>