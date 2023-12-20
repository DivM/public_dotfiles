# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# echo ".zshrc was executed"

# TMUX on MacOS messes with the PATH variable. Following code fixes it by resetting PATH and calling /etc/zprofile
# Ref: https://www.reddit.com/r/neovim/comments/13nvu4c/nvimlspconfigpyright_cannot_find_python_packages/
# Ref: https://gist.github.com/ekreutz/995bb95e428358b9efa2b2f80b02143c
if [ "$TERM_PROGRAM" = tmux ]; then
    # echo 'In tmux, resetting path'
    PATH=""
    source /etc/zprofile
    # else
    #     echo 'Not in tmux'
fi

# # Adding this so that $PATH is set properly inside the TMUX session
# if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
#     # PS1="@$HOSTNAME $PS1"
# fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="${PATH}:/Users/dkm/.local/bin"
export PATH="${PATH}:/Users/dkm/.local/lib/python3.10/site-packages"

# Customizing History
setopt APPEND_HISTORY
touch $HOME/.config/zsh/zsh_history_file
HISTFILE=$HOME/.config/zsh/zsh_history_file
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS

# Custom Aliases
source ~/Documents/githubRepos/dotfiles/scripts/mac/mac_aliases.sh

# Custom KeyBindings
# bindkey -s '^V' tmux-sessionizer
# bindkey '^[[46;5u' "tmux-sessionizer\n"

# Import zsh Plugins:
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/z/z.sh
source ~/.config/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Configure zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line vi-end-of-line vi-add-eol)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char vi-forward-char
    forward-word vi-forward-word
    vi-forward-word-end vi-forward-blank-word vi-forward-blank-word-end
    vi-find-next-char vi-find-next-char-skip
)

# Configure zsh-z
touch /Users/dkm/.config/zsh/z_data
_Z_DATA='/Users/dkm/.config/zsh/z_data'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# updating conda environment when running TMUX session of a specific name
# if {[ "$TERM_PROGRAM" = tmux] && [ "t display-message -p '#S'" = tmux ];} then
if [ "$TERM_PROGRAM" = tmux ]; then
    TMUX_SESSION_NAME=$(eval "t display-message -p '#S'")
    case "$TMUX_SESSION_NAME" in
        "webdev")
            echo "In webdev session, loading conda env"
            conda activate webdev
            ;;
        "datascience" | "data-science" | "machine-learning")
            echo "In DS/ML session, loading conda env"
            conda activate datascience
            ;;
        "programming-practice")
            echo "In programming-practice session, loading conda env"
            conda activate dsa
            ;;
        *) # default option
            # echo "Unknown session"
            ;;
    esac
fi
