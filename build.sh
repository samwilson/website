#!/bin/bash

## Set up the source and destination directories.
THISDIR=$(cd $(dirname $0); pwd)
cd "$THISDIR"

## Set paths to the template files.
HTMLTPL=$THISDIR"/html.tpl"
PDFTPL=$THISDIR"/pdf.tpl"

## Build all single-page files (HTML and PDF).
ALL_MD_FILES=$(find $THISDIR -iname '*.md' -type f)
for F in $ALL_MD_FILES; do

	## Ignore the readme file.
	if [ $(basename $F) = "README.md" ]; then continue; fi

	## Extract just the 'local' part of the path.
	BASE_LEN=${#THISDIR}+1
	FILE=${F:$BASE_LEN:-3}
	echo "Processing $FILE";
	SLASHS=${FILE//[^\/]/}
	SLASHCOUNT=${#SLASHS}
	RELPATH=$(for X in $(seq $SLASHCOUNT); do echo -n "../"; done)

	## Create required directories.
	mkdir -p "$THISDIR/"$(dirname "$FILE")

	## Generate HTML version.
	pandoc --standalone \
		--css=/style.css \
		--section-divs \
		--template=$HTMLTPL \
		--variable="filename:$FILE" \
		--variable="relpath:$RELPATH" \
		-f markdown \
		-t html5 \
		-o "$THISDIR/$FILE.html" \
		"$FILE.md"

	## Generate PDF version.
	pandoc --standalone \
		--template=$PDFTPL \
		--variable="filename:$FILE" \
		-f markdown \
		-o "$THISDIR/$FILE.pdf" \
		"$FILE.md"

done
