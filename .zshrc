export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f ~/.zplug/zplug ]
then
    source ~/.zplug/zplug
fi

if [ $ZPLUG_HOME ]
then
    zplug "plugins/git", from:oh-my-zsh, if:"which git"
    zplug "plugins/command-not-found", from:oh-my-zsh
    zplug "themes/af-magic", from:oh-my-zsh

    # local plugins
    # pyenv
    zplug "~/.zsh", of:pyenv.zsh, from:local
    # rbenv
    zplug "~/.zsh", of:rbenv.zsh, from:local
    # nvm
    zplug "~/.zsh", of:nvm.zsh, from:local
    # direnv
    zplug "~/.zsh", of:direnv.zsh, from:local

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load  # --verbose
fi

eval `ssh-agent` > /dev/null

alias sudo="sudo -E"

bindkey -v

if builtin command -v vim > /dev/null; then
    alias vi="vim"
fi

if builtin command -v hub > /dev/null; then
    eval "$(hub alias -s)"
fi
 
# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

# dckrm
export DCKRM_EDITOR="vim"

# zmv
autoload -Uz zmv

# uvbm
export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"


# # cabal(Haskell package manager)
# if [ -d $HOME/.cabal/bin ]
# then
#     export PATH="$HOME/.cabal/bin:$PATH"
# fi
# 
# function notify() {
#     # 直前のコマンドのステータスを見て、通知を行う
#     # echo foo; notify 成功時のメッセージ 失敗時のメッセージ
#     FLAG=$?
#     : $1 $2
#     if [ $FLAG -eq 0 ]
#     then
#         notify-send -i $HOME/.notify/success.png $1
#     else
#         notify-send -u critical -i $HOME/.notify/failure.png $2
#     fi
#     return 0
# }
