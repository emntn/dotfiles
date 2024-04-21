#!/bin/sh  
youtube-dl -g -f best $1 | xargs mpv
