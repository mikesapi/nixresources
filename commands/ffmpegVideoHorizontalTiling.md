# Tile three videos vertically with ffmpeg (no audio)

## Command.
```
ffmpeg -i video0.mp4 -i video1.mp4 -i video2.mp4 -filter_complex "[0:v][1:v][2:v]vstack=inputs=3" output.mp4
```
