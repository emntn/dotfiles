#!/bin/bash

session="base"

# current week as filename
journal=journal_w$(date "+%V").md
year=$(date "+%Y")

tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window 'note'
tmux send-keys -t $session:$window 'sh ~/.scripts/journal/load_journal.sh && cd ~/notes && vim -O personal/journal/'$year'/'$journal' dev/learning/04_hunting_for_a_new_job.md' C-m

window=2
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
