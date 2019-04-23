# Rotate a video by 90 degrees clockwise.

#### Sometimes when capturing a video on a phone, it plays back as a landscape 'rotated' version on PC. This command will rotate the video back to it's intended orientation.

## Command:
```
ffmpeg -i input.mp4 -vf "ttranspose=dir=1:passthrough=portrait" output.mp4
```
