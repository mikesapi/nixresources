#! /bin/bash -e

# Check the input.
function help {
  echo ""
  echo "Stack (vertical) all .mp4s in a directory."
  echo "Usage: ./hstack_mp4_dir.sh [path/to/dir] [output.mp4]"
  echo ""
}

if [ $# -ne 2 ]
then
  help
  exit
fi

if [ ! -d $1 ]
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


indir=$1
outfile=$2
args=()
args2=()
COUNTER=0
for f in $indir/*.mp4
do
  echo $f
  args+=" -i ${f}"
  args2+=[${COUNTER}:v]
  let COUNTER=COUNTER+1
done

cmd="ffmpeg ${args} -filter_complex \"${args2}vstack=inputs=${COUNTER}\" ${outfile}"
echo $cmd
eval "$cmd"
