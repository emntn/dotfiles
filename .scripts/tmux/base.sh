#!/bin/bash

session="base"

# current week as filename
journal=journal_w$(date "+%V").md
year=$(date "+%Y")

tmux new-session -d -s $session

window=1
tmux new-window -t $session:$window
tmux rename-window -t $session:$window 'mutt'
tmux send-keys -t $session:$window 'cd ~/Downloads && mutt' C-m
tmux split-window -h
tmux send-keys 'calopen' C-m
tmux select-pane -L

window=2
tmux new-window -t $session:$window
tmux rename-window -t $session:$window 'note'
tmux send-keys -t $session:$window 'sh ~/.scripts/journal/load_journal.sh && cd ~/notes && vim -O personal/journal/'$year'/'$journal' personal/goals/new_life/02_time_to_execute.md' C-m

window=3
tmux new-window -t $session:$window

tmux a -t  $session:2
tmux switch-client -t $session:2
