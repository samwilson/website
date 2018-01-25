#!/bin/bash

## Set up the source and destination directories.
THISDIR=$(cd $(dirname $0); pwd)
#cd "$THISDIR"

## Find working directory/filename.
WORKPATH="$THISDIR"
if [[ -d "$1" || ( -f "$1" && "$1" == *.md ) ]]; then
    WORKPATH="$1"
else
    echo "Please provide a directory or markdown filename as the first parameter"
    exit 1
fi

## Set paths to the template files.
HTMLTPL=$THISDIR"/html.tpl"
PDFTPL=$THISDIR"/pdf.tpl"

## Build HTML and PDF of all requested files.
ALL_MD_FILES=$(find "$WORKPATH" -iname '*.md' -type f)
for F in $ALL_MD_FILES; do

	## Extract just the 'local' part of the path.
	FULLPATH=$(realpath $F)
	BASE_LEN=$(( ${#THISDIR} + 2 ))
	FILE=$(echo $FULLPATH | cut -c $BASE_LEN- | rev | cut -c 4- | rev)
	echo "Processing $FILE";
	SLASHS=${FILE//[^\/]/}
	SLASHCOUNT=${#SLASHS}
	RELPATH=$(for X in $(seq $SLASHCOUNT); do echo -n "../"; done)

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
		"$THISDIR/$FILE.md"

	## Generate PDF version.
	pandoc --standalone \
		--template=$PDFTPL \
		--variable="filename:$FILE" \
		-f markdown \
		-o "$THISDIR/$FILE.pdf" \
		"$THISDIR/$FILE.md"

done
