#!/bin/bash

session="chocops"

libchoc="~/Repositories/chocops/libchoc"
auth="~/Repositories/chocops/auth"
vogon="~/Repositories/chocops/vogon"

tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -s $session -n "fish" -x "$(tput cols)" -y "$(tput lines)"

	tmux new-window -t $session -n "libchoc"
	tmux send-keys -t $session "cd $libchoc" C-m
	tmux send-keys -t $session "clear" C-m
	tmux split-window -l 18 -t $session
	tmux send-keys -t $session "cd $libchoc" C-m
	tmux send-keys -t $session "clear" C-m

	tmux new-window -t $session -n "auth"
	tmux send-keys -t $session "cd $auth" C-m
	tmux send-keys -t $session "clear" C-m
	tmux split-window -l 18 -t $session
	tmux send-keys -t $session "cd $auth" C-m
	tmux send-keys -t $session "clear" C-m

	tmux new-window -t $session -n "vogon"
	tmux send-keys -t $session "cd $vogon" C-m
	tmux send-keys -t $session "clear" C-m
	tmux split-window -l 18 -t $session
	tmux send-keys -t $session "cd $vogon" C-m
	tmux send-keys -t $session "clear" C-m
fi

tmux attach-session -t $session
