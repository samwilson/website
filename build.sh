#!/bin/bash

## Set up the source and destination directories.
INDIR=$(cd $(dirname $0); pwd)

## Build all single-page files (HTML and PDF).
for F in $(find $INDIR -name '*.md' -type f); do

	if [ $F = "README.md" ]; then continue; fi
	#BASENAME=$( basename -s".md" "$F" );

	## Build RSS item (to be later combined into a single file).

	## Extract just the 'local' part of the path.
	BASE_LEN=${#INDIR}+1
	FILE=${F:$BASE_LEN:-3}
	echo "Processing $FILE";
	SLASHS=${FILE//[^\/]/}
	SLASHCOUNT=${#SLASHS}
	RELPATH=$(for X in $(seq $SLASHCOUNT); do echo -n "../"; done)

	## Generate HTML version.
	pandoc --standalone \
		--css=/style.css \
		--section-divs \
		--template=html.tpl \
		--variable="filename:$FILE" \
		--variable="relpath:$RELPATH" \
		-f markdown \
		-t html5 \
		-o "$FILE.html" \
		"$INDIR/$FILE.md"

    ## Generate PDF version.
	pandoc --standalone \
		--template=latex.tpl \
		--variable="filename:$FILE" \
		-f markdown \
		-o "$FILE.pdf" \
		"$INDIR/$FILE.md"

done

## Build LaTeX
#echo "Building whole-site PDF"
#pandoc -o $OUTDIR/samwilson.pdf --toc *.md
