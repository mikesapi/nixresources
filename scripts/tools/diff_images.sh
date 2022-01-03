#! /bin/bash -e

function help {
  echo ""
  echo "Usage: ./diff_images /path/to/image1.jpg /path/to/image2.jpg /path/to/output.jpg"
  echo ""
}

if [ $# -ne 3 ]
then
  help
  exit
fi

image1=$1
image2=$2
output=$3

convert $image1 $image2 -compose difference -composite \
    -evaluate Pow 2 -evaluate divide 3 -separate \
    -evaluate-sequence Add -evaluate Pow 0.5 \
    $output

convert -resize 50% -delay 50 -loop 0 $image1 $image2 $output.gif
