# PATHの記述ルール
# 原則前に書く
# export PATH=hoge:$PATH
# よって優先度の高いものほど後ろに書く

# Mac
# path_helper を呼び出していた /etc/profile を読み込まない
# 環境変数の上書き防止
setopt no_global_rcs

export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=100000

export ZPLUG_HOME=$HOME/.zplug
unset ZPLUG_SHALLOW

export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Go
export GOPATH=$HOME/.go

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_SHELL=zsh

# virtualenvwrapper
# export WORKON_HOME=~/.virtualenvs

# vim-virtualenv
# export VIRTUAL_ENV=nvim

typeset -U path
path=(
    /usr/local/bin
    /usr/sbin
    /sbin
    $(brew --prefix coreutils)/libexec/gnubin
    /usr/local/opt/findutils/libexec/gnubin
    $HOME/bin
    # nodebrew
    $HOME/.nodebrew/current/bin
    # Go
    $GOPATH/bin
    /usr/local/go/bin
    # pyenv
    $PYENV_ROOT/bin
    $PYENV_ROOT/shims
    # rbenv
    $HOME/.rbenv/bin

    $path
)
export PATH

# mac
# PATH=/usr/local/bin:/usr/sbin:/sbin:$PATH

# PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
# Mac Android Debug Bridge
# PATH="/Users/suzuki.shunsuke/Library/Android/sdk/platform-tools"

# PATH=$HOME/bin:$PATH

# nodebrew
# PATH=$HOME/.nodebrew/current/bin:$PATH

# Heroku
# export PATH="/usr/local/heroku/bin:$PATH"


# uvbm
# export UVBM_ROOT="$HOME/.ghq/gitlab.com/suzuki-shunsuke/unite.vim_bookmark"

# dckrm
# if builtin command -v vim > /dev/null; then
#     export DCKRM_EDITOR="vim"
# fi

# PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"

# Ansible
# export ANSIBLE_LIBRARY=$HOME/ansible/modules
# export ANSIBLE_ROLES_PATH=$HOME/ansible/roles

# PATH="$PYENV_ROOT/bin:$PATH"
if [ -d $PYENV_ROOT ]; then
  # PATH="/Users/shunsuke/.pyenv/shims:${PATH}"
  eval "$(pyenv init -)"
fi

# pyenv virtualenv
eval "$(pyenv virtualenv-init -)"

# rbenv
# PATH="$HOME/.rbenv/bin:$PATH"
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

# dirssh
# https://github.com/suzuki-shunsuke/dirssh
# export DIRSSH_ALIAS=ssh
# export DIRSSH_CFGNAME=sshcfg

# export FPATH=~/.ghq/github.com/suzuki-shunsuke/zsh.conf:$FPATH

# export PATH=~/bin:$PATH

# export FPATH="$HOME/.ghq/github.com/suzuki-shunsuke/zsh.conf/functions:${FPATH}"

# The next line updates PATH for the Google Cloud SDK.
test -f /usr/local/lib/google-cloud-sdk/path.zsh.inc && source '/usr/local/lib/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
test -f /usr/local/lib/google-cloud-sdk/completion.zsh.inc && source '/usr/local/lib/google-cloud-sdk/completion.zsh.inc'
