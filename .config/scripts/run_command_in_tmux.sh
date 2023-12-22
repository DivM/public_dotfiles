#!/bin/zsh

# TODO - One major problem with this script is that it can't send multiple commands concatenated by ';'
# I'm not sure why that is but it is the case. Need fixing.

if [ "$TERM_PROGRAM" = tmux ]; then  # check if script is run from inside TMUX session
    TMUX_PANE_COUNT=$(tmux list-panes | wc -l)
    if [ "$TMUX_PANE_COUNT" -eq 1 ]; then
        tmux split-window -vc "#{pane_current_path}" \; resize-pane -y 35%  # If a single pane is open, open a new pane
        tmux send-keys -t 1 "$*" C-m
    elif [ "$TMUX_PANE_COUNT" -eq 2 ]; then
        tmux send-keys -t 1 Escape  # Adding this because of zsh-vi-mode
        sleep 1  # for some stupid reason, removing this sleep fails the next command i.e. INSERT mode entry
        tmux send-keys -t 1 i
        tmux send-keys -t 1 "$*" C-m
    else
        # ###### TMP ######
        # tmux send-keys -t 1 Escape  # Adding this because of zsh-vi-mode
        # sleep 1  # for some stupid reason, removing this sleep fails the next command i.e. INSERT mode entry
        # tmux send-keys -t 1 i
        # tmux send-keys -t 1 "$*" C-m
        # ###### TMP ######
        echo "There are more than 2 panes. Don't where to send the $1 command"
        exit 0
    fi
else
    echo "Not running inside a TMUX session"
    exit 0
fi
