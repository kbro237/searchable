# searchable.sh

This script will take all the .pdf files in a directory and use
[pdfocr](http://github.com/gkovacs/pdfocr) to run ocr and make them
searchable pdfs.

Then, the old pdf's are moved to a directory called `obsolete pdfs` in case they are wanted, or the ocr'ing hoses them.

## usage

    cd $directory
	searchable.sh
