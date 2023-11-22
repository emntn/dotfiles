#!/bin/sh
cd ~/notes
git add . && git commit -m "$(date "+%d%m%Y")" && git push origin master
cd
