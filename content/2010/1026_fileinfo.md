---
id: 622
title: 'PHP’s Fileinfo extension under PHP 5.2 on Windows'
date: 2010-10-26T11:29:07+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=622
permalink: /2010/10/26/fileinfo/
aktt_tweeted:
  - "1"
views:
  - "54348"
dsq_thread_id:
  - "3857935910"
categories:
  - Programming
tags:
  - Fileinfo
  - Pecl
  - PHP
  - Windows
---
I have been pulling my hair out this morning trying to get the PHP Fileinfo extension working under PHP 5.2.14 on Windows Server 2003 SE. Actually, to be accurate: I’ve been trying to get the PHP Fileinfo extension working; the pulling out of hair is a normal occurrence when doing anything on a Windows server, I am learning.

Last week I ended up installing PHP 5.2 rather than 5.3, all because I read that the LDAP extension wasn’t yet available for 5.3 on Windows. Then this week it looks like Fileinfo is available for 5.3 but _not_ 5.2! Why oh why did I agree to move to a blasted Windows machine from my nice well-setup and working Ubuntu box?!

Anyway, I tried to install Fileinfo from PECL (with the same result with both the `pecl` and `pear` commands):

```
D:>pear install pecl/fileinfo
WARNING: "pear/Fileinfo" is deprecated in favor of "channel://php-src/ext/fileinfo/in php sources"
downloading Fileinfo-1.0.4.tgz ...
Starting to download Fileinfo-1.0.4.tgz (5,835 bytes)
.....done: 5,835 bytes
3 source files, building
ERROR: The DSP Fileinfo.dsp does not exist.
```

PECL [bug #12603](http://pecl.php.net/bugs/bug.php?id=12603) is about this problem, but is still open and was no help.

**The solution:**

I’ll skip the details of the loops and deadends I traversed in trying to fix this. There were different PHP version, different DLLs, and any number of forums and Scroogle searches, but ultimately I:

  1. went down [the list](http://www.php.net/releases/) of old PHP releases to the most recent 5.2 release that had a separate _Collection of PECL modules_; this was 5.2.5, and I downloaded it;
  2. copied the php_fileinfo.dll from [pecl-5.2.5-Win32.zip](http://museum.php.net/php5/pecl-5.2.5-Win32.zip) and put it where all the other extensions live;
  3. added the `extension=php_fileinfo.dll` line to php.ini; and
  4. restarted Apache.

So simple, and magically everything now works! So I thought I’d post this here, in case anyone else’s having the same problem. I’ll add a note to that bug report too.