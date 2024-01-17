# TMUX on MacOS messes with the PATH variable. Following code fixes it by resetting PATH and calling /etc/zprofile
# Ref: https://www.reddit.com/r/neovim/comments/13nvu4c/nvimlspconfigpyright_cannot_find_python_packages/
# Ref: https://gist.github.com/ekreutz/995bb95e428358b9efa2b2f80b02143c
if [ "$TERM_PROGRAM" = tmux ]; then
    # echo 'In tmux, resetting path'
    PATH=""
    source /etc/zprofile
    # else
        # echo 'Not in tmux'
fi

# # Adding this so that $PATH is set properly inside the TMUX session
# if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
#     # PS1="@$HOSTNAME $PS1"
# fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Customizing History
setopt APPEND_HISTORY
touch $HOME/.config/zsh/zsh_history_file
HISTFILE=$HOME/.config/zsh/zsh_history_file
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS

# Custom Aliases
source "$HOME/Personal/public_dotfiles/.config/scripts/mac_aliases.sh"

# # Import zsh Plugins:
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh
source $(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
# source ~/.config/zsh/z/z.sh

# # Configure zsh-autosuggestions
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line vi-end-of-line vi-add-eol)
# ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
#     forward-char vi-forward-char
#     forward-word vi-forward-word
#     vi-forward-word-end vi-forward-blank-word vi-forward-blank-word-end
#     vi-find-next-char vi-find-next-char-skip
# )

# add `code` command to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

source "$HOME/.config/ccm/azure_PAC_setter.sh"

# # Configure zsh-z
# touch /Users/dkm/.config/zsh/z_data
# _Z_DATA='/Users/dkm/.config/zsh/z_data'
#
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

