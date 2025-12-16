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
      if [ ! -d ~/repos/work/$session ]; then
        mkdir ~/repos/work/$session
      fi
      cd ~/repos/work/$session
      ;;
  esac
done

tmux new-session -d -s $session

# --- transport project ---
if [ "$session" = "transport" ]; then
  window=1
  tmux send-keys -t "$session:$window" \
    'vim frontend/index.html' C-m

  window=2
  tmux new-window -t "$session:$window" -n 'backend'
  tmux send-keys -t "$session:$window" 'cd backend && nvm use v22.21.1 && clear' C-m

  window=3
  tmux new-window -t $session:$window

  window=4
  tmux new-window -t $session:$window -n 'log'
  tmux send-keys -t "$session:$window" 'work' C-m

  tmux a -t "$session:1"
  tmux switch-client -t "$session:1"
  exit 0
fi
# --- end transport project ---

window=1
if [ -f "main.go" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'vim -O main.go todo.md' C-m
  else
    tmux send-keys -t $session:$window 'vim main.go' C-m
  fi
elif [ -f "cmd/app/main.go" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'vim -O cmd/app/main.go todo.md' C-m
  else
    tmux send-keys -t $session:$window 'vim cmd/app/main.go' C-m
  fi
elif [ -f "cmd/main.go" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'vim -O cmd/app/main.go todo.md' C-m
  else
    tmux send-keys -t $session:$window 'vim cmd/app/main.go' C-m
  fi
elif [ -f "src/main.rs" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'vim -O src/main.rs todo.md' C-m
  else
    tmux send-keys -t $session:$window 'vim src/main.rs' C-m
  fi
else
  tmux send-keys -t $session:$window
fi

window=2
tmux new-window -t $session:$window

window=3
tmux new-window -t $session:$window

tmux a -t  $session:1
tmux switch-client -t $session:1
