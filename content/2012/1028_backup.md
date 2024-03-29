---
id: 1349
title: Setting up USB drives for backup
date: 2012-10-28T11:07:59+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=1349
permalink: /2012/10/28/backup/
views:
  - "7509"
categories:
  - Programming
tags:
  - backups
  - FAT
  - filesystems
  - Linux
  - mtools
  - system administration
  - ubuntu
---
I use USB hard drives for backing up one of my machines, swapping them regularly but leaving everything else up to the backup script that runs daily. This means that I want to **mount them at the same place every time**, regardless of which drive I plug in or what device it is registered as. This isn’t very difficult because `fstab` can use UUIDs or labels to identify disks:

```
UUID=6B70-A309    /media/sw_backup vfat user 0 0
LABEL="SW_BACKUP" /media/sw_backup vfat user 0 0
```

(Note: these backup drives are formatted with FAT filesystems so that I can if need be restore on [any](http://en.wikipedia.org/wiki/Comparison_of_file_systems#Supporting_operating_systems "Wikipedia's list of which OSs support which filesystems") system if required.)

To avoid having to manually add the disk every time I put a new one into rotation, I go with the label method.

To use this, each disk must be given the same label (and then not plugged in at the same time!). To set the label, first find the device:

```
sw@swbackup:~/backups$ sudo blkid
/dev/sda3: UUID="f31d1291-9d6f-441d-9f8d-fa34e9f569d5" TYPE="swap"
/dev/sda4: UUID="8a0b99a2-8a2e-4eae-7666-d607fbc44de5" TYPE="ext4"
/dev/sdb1: LABEL="NONAME" UUID="4A39-C8E7" TYPE="vfat"
```

Then `sudoedit /etc/mtools.conf` to add the following, where the device name is the same as above:

```
mtools_skip_check=1
drive s: file="/dev/sdb1"
```

Now `mtools` can change the label:

```
sw@swbackup:~/backups$ sudo mlabel -s s:
 Volume label is NONAME
sw@swbackup:~/backups$ sudo mlabel s:<strong style="color:#060">SW_BACKUP</strong>
sw@swbackup:~/backups$ sudo mlabel -s s:
 Volume label is SW_BACKUP
```
