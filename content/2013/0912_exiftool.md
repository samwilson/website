---
title: Rename and move images according to date
date: 2013-09-12T16:10:18+00:00
tags:
  - Programming
  - exiftool
  - filing
  - images
  - organising
  - photographs
  - scripts
---
My simple `import-images.sh` script that I use to shift files into my ([ownCloud](http://owncloud.org/)-backed) archiving system:

    #!/bin/bash
    
    if [ ! -d "$1" ]; then
      echo "Error: first parameter must be a directory" >&2
      echo "Usage: "$(basename $0) <dir>"
      echo "       where <dir> is an existing directory from which to import images"
      exit 1
    fi
    
    DEST=$HOME/photos
    exiftool '-FileName<DateTimeOriginal' -d $DEST"/%Y/%m_%b/%d/%Y-%m-%d_%H%M%%+c.%%e" "$1"
