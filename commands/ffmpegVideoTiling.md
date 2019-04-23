# Tile four videos with ffmpeg (no audio).

## Command.
```
ffmpeg -i input1.mp4 -i input2.mp4 -i input3.mp4 -i input4.mp4 -filter_complex '[0:v]pad=iw*2:ih*2:0:0[int2];[int2][1:v]overlay=0:H/2[int3];[int3][2:v]overlay=W/2:0[int4];[int4][3:v]overlay=W/2:H/2[out]' -map [out] -c:v libx264 -crf 23 -preset veryfast output.mp4
```
