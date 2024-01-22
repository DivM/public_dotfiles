alias szsh='source ~/.zshrc'

alias ls='ls -a --color=auto'
alias ll='ls -alh --color=auto'
alias tree='tree -C'

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

alias gl='git log --oneline'
alias gla='git log --all --oneline --graph'
alias gls='git log --decorate=short'
alias glsa='git log --decorate=short --all --graph'
alias glf='git log --pretty=fuller'
alias glfa='git log --pretty=fuller --all --graph'

alias gs='git status'

alias gf='git fetch --all'

alias gq='git stash -u'
alias gql='git stash list'
alias gqp='git stash pop'
alias gqs='git stash show'
alias gqd='git stash drop'

alias lc="wc -l"

alias tmux-sessionizer="source ~/Documents/githubRepos/dotfiles/scripts/mac/tmux_sessionizer.sh"
# bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

# # git aliases
# [alias]
# # git log
#     lg = lg1
#     lg1 = lg1-specific --all
#     lg2 = lg2-specific --all
#     lg3 = lg3-specific --all
#     lg1-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'
#     lg2-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
#     lg3-specific = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'


