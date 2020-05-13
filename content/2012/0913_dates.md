---
id: 1292
title: 'Getting a proper %DATE% variable in batch files'
date: 2012-09-13T14:27:40+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1292
permalink: /2012/09/13/dates/
views:
  - "2066"
categories:
  - Programming
tags:
  - batch files
  - cmd
  - date formatting
  - dates
  - DOS
  - Java
  - variables
  - Windows
---
Windows batch files are hideous things, if one is used to *nix shell scripting. Everything feels wrong! Of course, that’s mostly just because they have a different syntax… but sometimes it’s because they _are_ wrong.

Date formatting, for instance.

There’s an environment variable, `%DATE%`, that holds the current date, but it’s formatted to the current locale’s ‘short date’ definition, and so does not produce a consistent output from system to system.

Something as simple as naming files becomes a hideous contortion of detecting formats, splitting strings apart, and hopefully re-joining them in the right order. Too annoying for me, today, so I’ve taken a leap out of `cmd` and into `java`:

Firstly, compile the following Java class.

<pre lang="java" line="1">import java.text.SimpleDateFormat;
import java.util.Date;

public class date {

    public static void main(String[] args) {
        Date date = new Date();
        String out = new SimpleDateFormat("yyyy-MM-dd").format(date);
        System.out.println(out);
    }
}
</pre>

<pre lang="bash">$ javac thedate.java
</pre>

Then, call it from a batch file with something like this:

<pre lang="dos" line="1">echo off
setlocal
java date > thedate.txt
set /p THEDATE= &lt; thedate.txt
del thedate.txt
echo The date is %THEDATE%
endlocal
</pre>

This is ridiculous, yes, but it does at least work.