#!/bin/bash -e

# Check the input
function help {
  echo ""
  echo "Usage: ./ghostscript-pdf-compress [PDFSETTINGS={screen, ebook, printer, prepress, default}] [input file name (pdf)] [output file name (pdf)]"
  echo "Example : ./ghostscript-pdf-compress prepress input.pdf output.pdf"
  echo ""
}

if [ $# -ne 3 ]
then
  help
  exit
fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/$1 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$3 $2 
