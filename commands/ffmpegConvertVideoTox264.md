# Use ffmpeg to compress a video with the H.264 standard.

## Command.
```
ffmpeg -i input -acodec libfaac -aq 100 -vcodec libx264 -preset slow -crf 26 -threads 0 output.mp4

```

To additionally scale the video add:
```
-vf scale=iw*.5:ih*.5
```

### Note that when installing ffmpeg from source (64-bit), configure with the following flags:
```
./configure --enable-gpl --enable-libfaac --enable-libx264 --enable-libxvid --enable-nonfree --enable-shared --enable-pic
make
sudo make install
```
