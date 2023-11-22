#!/bin/bash

session="base"

# current week as filename
journal=journal_w$(date "+%V").md

tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window 'note'
tmux send-keys -t $session:$window 'cd ~/notes && vim -O personal/journal/2023/'$journal' dev/rust/06_change_in_course.md' C-m

window=2
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
