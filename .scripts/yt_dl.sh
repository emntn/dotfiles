#!/bin/sh  
yt-dlp -g -f b $1 | xargs mpv
