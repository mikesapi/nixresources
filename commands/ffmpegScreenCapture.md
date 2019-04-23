# Capture the screen with ffmpeg.

* Note: Remove screen lock and make sure that the power settings don't switch off the screen after some time.

## Command.
```
ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1280x720 -i :0.0+0,24 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -threads 0 output.mkv

```


