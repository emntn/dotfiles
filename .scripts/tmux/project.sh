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
if [ -f "main.go" ]; then
  tmux send-keys -t $session:$window 'vim -O main.go readme.md' C-m
elif [ -f "src/main.rs" ]; then
  tmux send-keys -t $session:$window 'vim -O src/main.rs readme.md' C-m
elif [ -f "main.py" ]; then
  tmux send-keys -t $session:$window 'vim -O main.py readme.md' C-m
else
  tmux send-keys -t $session:$window 'vim' C-m
fi


window=2
tmux new-window -t $session:$window

window=3
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
