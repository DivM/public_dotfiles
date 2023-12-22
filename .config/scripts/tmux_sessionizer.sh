#!/usr/bin/env zsh

WORK_DIRS=("$HOME/Documents/githubRepos" "$HOME/.config")

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find "${WORK_DIRS[@]}" -mindepth 0 -maxdepth 1 -type d | fzf)
fi

echo $selected

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# if $TMUX and $tmux_running are empty (i.e. TMUX is not running and is not attached) create session with name as $selected_name opened in $selected dir
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

# create session with name as $selected_name opened in $selected dir
if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name  # switch current client (terminal) to $selected_name session
