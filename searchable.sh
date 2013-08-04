#!/usr/bin/env bash
# This script will take all the .pdf files in a directory and use
# [pdfocr](http://github.com/gkovacs/pdfocr) to run ocr and make them
# searchable pdfs. The raw files will be kept for now?

for raw in *.pdf
do
	justthename=`basename "$raw" | sed 's/\.pdf//'`
	pdfocr -t -i "$raw" -o "$justthename.searchable.pdf"
done
