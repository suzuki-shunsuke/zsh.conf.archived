export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZPLUG_HOME=$HOME/.zplug

export ZPLUG_CLONE_DEPTH=1
unset ZPLUG_SHALLOW

if [ -f ~/.zplug/init.zsh ]
then
    source ~/.zplug/init.zsh
fi

autoload -Uz compinit
autoload -Uz colors
compinit

if [ $ZPLUG_HOME ]
then
    zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
    zplug "plugins/command-not-found", from:oh-my-zsh
    # zplug "themes/aussiegeek", from:oh-my-zsh
    zplug "zsh-users/zsh-completions"
    # compinit 以降に読み込むようにロードの優先度を変更する（10~19にすれば良い）
    zplug "zsh-users/zsh-syntax-highlighting", nice:10
    zplug "mollifier/cd-gitroot"
    zplug "mollifier/anyframe"
    zplug "mafredri/zsh-async", on:sindresorhus/pure
    zplug "sindresorhus/pure", use:pure.zsh, nice:10

    # local plugins
    # pyenv
    zplug "~/.zsh", use:pyenv.zsh, from:local
    # rbenv
    zplug "~/.zsh", use:rbenv.zsh, from:local
    # nvm
    # zplug "~/.zsh", use:nvm.zsh, from:local
    # direnv
    zplug "~/.zsh", use:direnv.zsh, from:local

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

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# uvbm
export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# dircolors
if [ -f ~/.colorrc ]
then
    eval `dircolors ~/.colorrc`
fi

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

# if type zprof > /dev/null 2>&1; then
#   zprof | less
# fi
