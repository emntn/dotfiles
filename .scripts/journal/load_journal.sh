#!/bin/sh

cd ~/notes
# Check if local repo is synced with remote repo
remote=$(
    git ls-remote -h origin master |
    awk '{print $1}'
)
local=$(git rev-parse HEAD)

if [[ $local != $remote ]]; then
    git pull origin master;
fi

cd -
