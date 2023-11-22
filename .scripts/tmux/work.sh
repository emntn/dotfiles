#!/bin/bash

session="work"

tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window 'work'
tmux send-keys -t $session:$window 'work' C-m

window=2
tmux new-window -t $session:$window -n 'code'
tmux send-keys -t $session:$window 'cd ~/repos/turkunlp' C-m

window=3
tmux new-window -t $session:$window -n 'term'

tmux a -t  $session:1
tmux switch-client -t $session:1
