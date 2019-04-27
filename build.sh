#!/bin/bash

## Set up the source and destination directories.
THISDIR=$(cd $(dirname $0); pwd)

## Find working directory/filename.
WORKPATH="$THISDIR"
MDDIR=$(realpath "$1")
if [[ -d "$MDDIR" || ( -f "$MDDIR" && "$MDDIR" == *.md ) ]]; then
    WORKPATH="$MDDIR"
else
    echo "Please provide a directory or markdown filename as the first parameter"
    exit 1
fi

## Set paths to the template files.
HTMLTPL=$THISDIR"/html.tpl"
PDFTPL=$THISDIR"/pdf.tpl"

# Build HTML and PDF of a whole directory.
if [[ -d "$MDDIR" && "$MDDIR" != "$THISDIR" ]]; then

    ## Extract just the 'local' part of the path.
    BASE_LEN=$(( ${#THISDIR} + 2 ))
    DIR=$(echo $MDDIR | cut -c $BASE_LEN-)
    echo "Processing $DIR";

    pandoc --standalone \
        --css=style.css \
        --variable="filename:$DIR" \
        --variable="relpath:./" \
        --metadata="title:$DIR" \
        --section-divs \
        --template=$HTMLTPL \
        -f markdown-implicit_figures \
        -t html5 \
        -o "$THISDIR/$DIR.html" \
        $THISDIR/$DIR/*.md
    pandoc --standalone \
        --variable="filename:$DIR" \
        --variable="relpath:./" \
        --metadata="title:$DIR" \
        --template=$PDFTPL \
        -f markdown \
        -o "$THISDIR/$DIR.pdf" \
        $THISDIR/$DIR/*.md
fi

## Build HTML and PDF of all requested files.
ALL_MD_FILES=$(find "$WORKPATH" -iname '*.md' -type f | sort)
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
