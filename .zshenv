# PATHの記述ルール
# 原則前に書く
# export PATH=hoge:$PATH
# よって優先度の高いものほど後ろに書く

# プロファイリング
# zmodload zsh/zprof

# Mac
# path_helper を呼び出していた /etc/profile を読み込まない
# 環境変数の上書き防止
setopt no_global_rcs

export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=100000

export ZPLUG_HOME=$HOME/.zplug
unset ZPLUG_SHALLOW

# mac
export PATH=/usr/local/bin:$PATH

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
# Mac Android Debug Bridge
# PATH="/Users/suzuki.shunsuke/Library/Android/sdk/platform-tools"

export PATH=$HOME/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Heroku
# export PATH="/usr/local/heroku/bin:$PATH"

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

# uvbm
# export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"

# Go
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# Ansible
# export ANSIBLE_LIBRARY=$HOME/ansible/modules
# export ANSIBLE_ROLES_PATH=$HOME/ansible/roles

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -d $PYENV_ROOT ]
then
    eval "$(pyenv init -)"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if [ -d $HOME/.rbenv/bin ]
then
    eval "$(rbenv init -)"
fi

# SSH Agentの設定
# 既に環境変数SSH_AUTH_SOCK が設定されていたら
# ssh-agentが起動しているものとして何もしない
# SSH_AUTH_SOCKが設定されていなかったら
# ssh-agentを起動してSSH_AUTH_SOCKを設定する
if [ -z "$SSH_AUTH_SOCK" ]
then
    eval `ssh-agent` > /dev/null
    export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
fi
