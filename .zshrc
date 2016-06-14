export PATH=$HOME/bin:/usr/local/bin:$PATH

export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=100000

autoload -Uz compinit
autoload -Uz colors
compinit

# source ~/.zsh/zplug.zsh
export ZPLUG_HOME=$HOME/.zplug
export ZPLUG_CLONE_DEPTH=1
unset ZPLUG_SHALLOW

if [ -f ~/.zplug/init.zsh ]
then
    source ~/.zplug/init.zsh
fi

if [ $ZPLUG_HOME ]
then
    zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
    zplug "plugins/command-not-found", from:oh-my-zsh
    # zplug "themes/af-magic", from:oh-my-zsh
    zplug "zsh-users/zsh-completions"
    # compinit 以降に読み込むようにロードの優先度を変更する（10~19にすれば良い）
    zplug "zsh-users/zsh-syntax-highlighting", nice:10
    zplug "mollifier/cd-gitroot"
    zplug "mollifier/anyframe"
    zplug "mafredri/zsh-async", on:sindresorhus/pure
    zplug "sindresorhus/pure", use:pure.zsh, nice:10

    # local plugins
    zplug "~/.zsh", use:pyenv.zsh, from:local
    zplug "~/.zsh", use:rbenv.zsh, from:local
    # zplug "~/.zsh", use:nvm.zsh, from:local
    # zplug "~/.zsh", use:go.zsh, from:local
    # zplug "~/.zsh", use:direnv.zsh, from:local
    # zplug "~/.zsh", use:vim.zsh, from:local
    # zplug "~/.zsh", use:hub.zsh, from:local
    # zplug "~/.zsh", use:fzf.zsh, from:local
    # zplug "~/.zsh", use:dckrm.zsh, from:local
    # zplug "~/.zsh", use:dircolors.zsh, from:local

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
alias ls="ls --color=auto"

bindkey -v

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# npm run aliases
NPM_ALIASES=(babel bower eslint grunt gulp mocha rollup webpack)
for i in $NPM_ALIASES
do
    alias $i="npm run $i"
done

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# zmv
autoload -Uz zmv

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# uvbm
export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"

# dckrm
if builtin command -v vim > /dev/null; then
    export DCKRM_EDITOR="vim"
fi

# vim
if builtin command -v vim > /dev/null; then
    alias vi="vim"
fi

# packer-io
if builtin command -v packer-io > /dev/null; then
    alias packer="packer-io"
fi

# dircolors
if [ -f ~/.colorrc ]
then
    eval `dircolors ~/.colorrc`
fi

# Go
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# direnv
if builtin command -v direnv > /dev/null ; then
    eval "$(direnv hook zsh)"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# hub
if builtin command -v hub > /dev/null; then
    eval "$(hub alias -s)"
fi

# anyframe
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^xf' anyframe-widget-insert-filename

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
