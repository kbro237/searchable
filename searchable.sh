#!/usr/bin/env bash
# This script will take all the .pdf files given as arguments and use
# [pdfocr](http://github.com/gkovacs/pdfocr) to run ocr and make them
# searchable PDFs. 

# make a directory for the raw PDFs after we're done with them
olddir="./obsolete pdfs"
mkdir "$olddir"

for raw in "$@"
do
	if [[ "$raw" != *.pdf ]]
	then
		echo "Arguments must be pdf files!"
		exit
	fi
	justthename=`basename "$raw" | sed 's/\.pdf//'`
	# run pdfocr.rb using the tesseract engine ( -t )
	pdfocr -t -i "$raw" -o "$justthename.searchable.pdf"

	# move out the raw PDFs and give them a new name based on the current
	# date
	mv "$raw" "$olddir/$justthename.`date "+%Y-%m-%d"`.pdf"
done
