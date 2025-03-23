#!/bin/bash

session="chocops"

base_dir=~/Repositories/chocops/

projects=(
  "infrastructure"
  "libchoc"
  "auth"
  "vogon"
  "dash"
)

setup_window() {
  local window_name=$1
  local path=$2

  tmux new-window -t $session -n "$window_name"
  tmux send-keys -t $session "cd $path" C-m
  tmux send-keys -t $session "clear" C-m
  tmux split-window -l 18 -t $session
  tmux send-keys -t $session "cd $path" C-m
  tmux send-keys -t $session "clear" C-m
}

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
  tmux new-session -d -s $session -n "fish" -x "$(tput cols)" -y "$(tput lines)"

  for i in "${!projects[@]}"; do
    setup_window "${projects[$i]}" "$base_dir/${projects[$i]}"
  done
fi

tmux attach-session -t $session
