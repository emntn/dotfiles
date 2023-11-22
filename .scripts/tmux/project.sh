#!/bin/bash

session=$2

while getopts 'pw:' OPTION; do
  case "$OPTION" in
    p)
      if [ ! -d ~/repos/personal/$session ]; then
        mkdir ~/repos/personal/$session
      fi
      cd ~/repos/personal/$session
      ;;
    w)
      if [ ! -d ~/repos/turkunlp/$session ]; then
        mkdir ~/repos/turkunlp/$session
      fi
      cd ~/repos/turkunlp/$session
      ;;
  esac
done

tmux new-session -d -s $session

window=1
tmux send-keys -t $session:$window 'vim' C-m

window=2
tmux new-window -t $session:$window

window=3
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
