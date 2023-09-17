---
id: 2274
title: 'Sync’ing all LDAP users into Drupal'
date: 2015-03-10T11:19:55+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2274
permalink: /2015/03/10/ldap_feeds/
dsq_thread_id:
  - "3857936033"
categories:
  - Programming
tags:
  - Drupal
  - lab notebook
---
Required modules: `ldap_feeds`, `ldap_query`, `feeds`, …

  1. Add desired fields to user accounts.
  2. Create an LDAP query that fetches the relevant attributes.
  3. Create a feeds importer: 
      * Fetcher: “LDAP Query Fetcher”
      * Parser: “LDAP Entry Parser for Feeds”
      * Processor: “User processor”
