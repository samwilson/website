---
id: 500
title: Concatenating a PDF and a bunch of JPGs
date: 2010-01-29T13:48:02+00:00
author: Sam Wilson
layout: post
guid: http://samwilson.id.au/?p=500
permalink: /2010/01/29/concatenating-a-pdf-and-a-bunch-of-jpgs/
views:
  - "245"
categories:
  - Miscellaneous
tags:
  - concatenation
  - image manipulation
  - ImageMagick
  - JPG
  - PDFs
---
Someone here at work wanted to know how to add a three-page PDF to a Word document, and then add a dozen photos after it, and then save the whole mess as a new PDF.

I suggested [ImageMagick’s `convert`](http://www.imagemagick.org/script/convert.php) and [`pdftk`](http://www.accesspdf.com/pdftk/).

1. Combine all the images into one PDF:

```
$ convert *.jpg photos.pdf
```

2. Put the two PDFs together:

```
$ pdftk report.pdf photos.pdf cat output report\_with\_photos.pdf
```

And that’s it.

(Of course, when one suggests this sort of thing to someone who wants to use Word, one invariable ends up doing it for them. Which is why I’ve posted this here, so in six months when I’m asked again, I’ll remember how to do it.)

**External links:**

Skala, M. 2008. _[How to concatenate PDFs without pain](http://ansuz.sooke.bc.ca/software/pdf-append.php)_.
