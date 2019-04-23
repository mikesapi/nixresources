# Use ffmpeg to convert an image sequence to a video.

## Command.
```
ffmpeg -f image2 -r 40 -i input_%05d.png -vcodec libx264 -crf 25 out.mp4
```
