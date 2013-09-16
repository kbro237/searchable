#!/usr/bin/env bash
# This script will take all the .pdf files given as arguments and use
# [pdfocr](http://github.com/gkovacs/pdfocr) to process them with ocr and
# make them searchable PDFs. 

# make a directory for the raw PDFs after we're done with them
olddir="/tmp/obsolete pdfs"
mkdir "$olddir"

for raw in "$@"
do
	# test if file looks like a pdf
	if [[ "$raw" != *.pdf ]]
	then
		echo "Arguments must be pdf files!"
		exit
	fi

	# move out the raw PDFs and give them a new name based on the current
	# date
	justthename=`basename "$raw" | sed 's/\.pdf//'`
	holding="$olddir/$justthename.$RANDOM.pdf"
	mv "$raw" "$holding"

	# run pdfocr.rb using the tesseract engine ( -t )
	pdfocr -t -i "$holding" -o "$justthename.pdf"

done
