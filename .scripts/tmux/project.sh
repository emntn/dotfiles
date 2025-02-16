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
elif [ -f "src/main.rs" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'vim -O src/main.rs todo.md' C-m
  else
    tmux send-keys -t $session:$window 'vim src/main.rs' C-m
  fi
elif [ -f "main.py" ]; then
  if [ -f "todo.md" ]; then
    tmux send-keys -t $session:$window 'source .venv/bin/activate.fish' C-m
    tmux send-keys -t $session:$window 'vim -O main.py todo.md' C-m
  else
    tmux send-keys -t $session:$window 'source .venv/bin/activate.fish' C-m
    tmux send-keys -t $session:$window 'vim main.py' C-m
  fi
elif [ -d ".venv" ]; then
    tmux send-keys -t $session:$window 'source .venv/bin/activate.fish' C-m
else
  tmux send-keys -t $session:$window
fi


window=2
tmux new-window -t $session:$window
if [ -f ".venv/bin/activate.fish" ]; then
    tmux send-keys -t $session:$window 'source .venv/bin/activate.fish' C-m
fi

window=3
tmux new-window -t $session:$window

if [[ "$(pwd)" == *"/turkunlp/"* ]]; then
    tmux rename-window -t $session:$window 'log'
    tmux send-keys -t $session:$window 'work' C-m
fi

tmux a -t  $session:1
tmux switch-client -t $session:1
