---
id: 2297
title: 'Never create a ‘status’ field'
date: 2013-11-26T10:04:46+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=2297
permalink: /2013/11/26/no-statuses/
dsq_thread_id:
  - "3857936011"
categories:
  - Programming
---
No database should ever have a ‘status’ field. They always get created, but never should. The status is always determined from other properties and relationships!

The problem with an explicit status is that it can (no: _will_) fail to agree with the status indicated by the rest of the system.