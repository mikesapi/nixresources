#! /bin/bash -e

# Check the input.
function help {
  echo ""
  echo "Concatenate all .mp4s in a list."
  echo "Usage: ./concatenate_mp4_dir.sh [path/to/list.txt] [output.mp4]"
  echo ""
}

if [ $# -ne 2 ]
then
  help
  exit
fi

if [ ! -f $1 ]
then
  echo "$1 does not exist"
  help
  exit
fi

if [ -f $2 ]
then
  echo "$2 already exists"
  help
  exit
fi

# First convert to mkv files, ensure all settings same across videos.
indir=$1
tmpdir='tmp-concat'
mkdir $tmpdir
COUNTER=0
for f in `sed '/^[$#]/d' $1`
do
  value=$(printf "%03d" $COUNTER)
  filename_ext=$(basename -- "$f")
  filename="${filename_ext%.*}"
  ffmpeg -i ${f} -vcodec libx264 -crf 20 -acodec aac -ar 44100 -ac 1 $tmpdir/$value-$filename.mkv
  let COUNTER=COUNTER+1
done

# Concatenate to mp4.
tmpfile='files_to_concatenate.txt'
outfile=$2
for f in $tmpdir/*.mkv
do
  echo file \'$f\' >> ${tmpfile}
done
ffmpeg -f concat -safe 0 -i ${tmpfile} -c copy ${outfile}

rm $tmpfile
rm -r $tmpdir
echo "Saved to: ${outfile}"
