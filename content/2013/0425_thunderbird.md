---
id: 1528
title: Backing up thunderbird email
date: 2013-04-25T14:20:15+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1528
permalink: /2013/04/25/thunderbird/
views:
  - "3099"
categories:
  - Programming
tags:
  - backups
  - data
  - email
  - mail
  - mbox
  - scripts
  - Subversion
  - Thunderbird
---
When [backing up Thunderbird](http://kb.mozillazine.org/Profile_backup "How it's supposed to be done"), the only files I worry about are the actual `mbox` files that store the ‘Local Folders’ (archived) email, and the `*.mab` addresbook files. Everything else is operational cruft. This might seem a bit extreme—after all, why not backup the account configurations and user preferences etc.—but I jump from machine to machine often enough, and reinstall things so regularly, that setting up a few email accounts now and then is too easy, and I prefer the minimalism. This way, I know exactly what I’m backing up and where my emails are, and I’m only backing up what’s essential. I’ve tested restoring to other email clients too (like [sylpheed](http://sylpheed.sraoss.jp/en/)), and all is seamless and heartening.

This minimal backup works too because I use the ‘archive’ function of Thunderbird, which is just a simple _“copy to date-based (i.e. year-based) folder hierarchy in Local Folders”_ function, activated by pressing `a`. Hence, I don’t bother filing emails by topic, and I store all sent items in the same folders are those received (yeah, I’m not suggesting that anyone else is ever going to find my system at all sensible). So the files backed up are small in number and never disappear (new ones are added, is all). I don’t back up what’s still up in the IMAP server, but then there’s not much of that at any given time.

The last part of my backup is to include all the files, both `mbox` and `mab`, in a version control system (in this case, Subversion). This way, I can roll back any file to any previous revision, easily. They’re all text, so the revision space-usage is efficient and of no worry; I’m only talking about half a gig per year anyway.

The script that does all this for me is simple:

```
#!/bin/bash

TB_PROFILE=/home/sam/.thunderbird/po2p7m5o.default/

MBOXEN=$(dirname $0)"/mboxen"
ABOOKS=$(dirname $0)"/abooks"

echo "Copying addressbooks to $ABOOKS..."
cp -v "$TB_PROFILE"*.mab "$ABOOKS/."

echo "Copying mail files to $MBOXEN..."
rsync -rv --exclude=*.msf "$TB_PROFILE/Mail/Local Folders/Archives.sbd/" $MBOXEN

# ...Followed by a svn commit
```

{link|mbox|http://en.wikipedia.org/wiki/Mbox|Why do I bother linking to Wikipedia? You weren't going to look elsewhere if you didn't know what mbox meant.} is a pretty ridiculous format, really. It’s based on the idea that it can determine the beginning of each email by the fact that the word ‘From’ starts a line and is followed by a space. That’s it! Daft. Thunderbird supposedly has some greater means of delimiting messages, but still I’ve on a number of occasions had email corrupted due to this silliness. Not hard to recover from, usually.
