alias szsh='source ~/.zshrc'

alias ls='ls -a --color=auto'
alias ll='ls -alh --color=auto'
alias tree='tree -C'

alias workon_programming='code $HOME/Documents/githubRepos/programming-practice'
alias workon_dotfiles='code $HOME/Documents/githubRepos/dotfiles'
alias workon_obsidian='code $HOME/Documents/githubRepos/obsidian-notes'
alias workon_myprojects='code $HOME/Documents/githubRepos/small-projects'

alias fcode='fd --type f --hidden --exclude .git | fzf-tmux | xargs code'
alias fnvim='fd --type f --hidden --exclude .git | fzf-tmux | xargs nvim'
#TODO https://superuser.com/questions/327762/how-to-find-a-directory-on-linux / finddir
#TODO https://www.plesk.com/blog/various/find-files-in-linux-via-command-line / findhere

alias t='tmux'
alias tl='tmux ls'
alias ta='tmux attach'
alias tn='tmux new'
alias ts='tmux send-keys'

# alias tsl='tmux send-keys -t left'
# alias tsr='tmux send-keys -t right'
# alias tsu='tmux send-keys -t up'
# alias tsd='tmux send-keys -t down'

 # target-pane (or src-pane or dst-pane) may be a pane ID or takes a similar form to target-window but with the optional
 # addition of a period followed by a pane index or pane ID, for example: ‘mysession:mywindow.1’.  If the pane index is
 # omitted, the currently active pane in the specified window is used.  The following special tokens are available for
 # the pane index:
 #
 # Token                  Meaning
 # {last}            !    The last (previously active) pane
 # {next}            +    The next pane by number
 # {previous}        -    The previous pane by number
 # {top}                  The top pane
 # {bottom}               The bottom pane
 # {left}                 The leftmost pane
 # {right}                The rightmost pane
 # {top-left}             The top-left pane
 # {top-right}            The top-right pane
 # {bottom-left}          The bottom-left pane
 # {bottom-right}         The bottom-right pane
 # {up-of}                The pane above the active pane
 # {down-of}              The pane below the active pane
 # {left-of}              The pane to the left of the active pane
 # {right-of}             The pane to the right of the active pane

alias ca='conda activate'
alias cx='conda deactivate'

alias glog='git log --oneline'
alias gstat='git status'
alias lc="wc -l"                                # line count

alias tmux-sessionizer="source ~/Documents/githubRepos/dotfiles/scripts/mac/tmux_sessionizer.sh"
# bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

