---
id: 1717
title: Random Windows annoyance
date: 2014-05-30T15:08:54+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1717
permalink: /2014/05/30/windoze/
views:
  - "1303"
dsq_thread_id:
  - "3868277780"
categories:
  - Programming
---
Task Scheduler is failing to run a particular task. Or, rather, it’s running it, exiting immediately, and refusing to log the output. (I don’t know why Microsoft came up with the brilliant idea of Task Scheduler _not having a MAILTO feature_!) This is a PHP command, something like `php file.php --param=val` …all Task Scheduler sees it as, according to its log, is `Task Scheduler successfully completed task "\Stage\DB\Generate_VU_files" , instance "{3676cfd5-9fc0-460d-9738-1b1b5347ecb9}" , action "C:\Program Files (x86)\PHP\php.exe" with return code 255.` Agh! Tell me more!

When the same ‘action’ command command is run from the command line, by the same user as whom Task Scheduler runs the task, everything works fine. There is no error, and the command does it stuff. Running through Task Scheduler, on the other hand… :-(

The chances are that this is a permissions problem.

…

Yes, it would seem that attempting to change permissions on a parent directory of the directory to which the command is trying to write gives “Error Applying Security”.

[An answer](http://serverfault.com/a/192750) on Server Fault suggests taking ownership (and only in Windows-world does one see things like “This can happen if you really don’t have access to that directory.”! because one’s first thought is always that the error is just stupid and not telling you the whole story —— I’m an admin, and admins have write access, but do I have write access? No!).

So I changed the owner of the target directory, clicking “Replace owner on subcontainers and objects”.

…

[tbc]