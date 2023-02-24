7#!/bin/bash

set -e

while true
do
  ffmpeg \
    -stream_loop -1 -re -i video.mp4 -stream_loop -1 -re -i https://stream-51.zeno.fm/8ymi1fecgqzvv?zs=ZPPD9y7OS8WJzwOqATMh8g  \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv rtmp://x.rtmp.youtube.com/live2/$YOUTUBE_KEY
done
