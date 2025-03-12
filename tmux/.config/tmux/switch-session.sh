#!/bin/bash

SESSION_NAME=$(tmux list-sessions -F '#S' | sed -n "${1}p")
if [ -n "$SESSION_NAME" ]; then
  tmux switch-client -t "$SESSION_NAME"
else
  echo "No session found at position $1"
fi
