#! /bin/bash -e

ffmpeg -i $1 -c:v libx264 -crf 20 -preset slower -c:a copy $1-reencoded.mp4
