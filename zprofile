{% from 'rc-fusion/macros/local.j2' import local %}
# PATHの記述ルール
# 原則前に書く
# export PATH=hoge:$PATH
# よって優先度の高いものほど後ろに書く

# Mac
# path_helper を呼び出していた /etc/profile を読み込まない
# 環境変数の上書き防止
setopt no_global_rcs

# XDG Base Direcotry Specification
export XDG_CONFIG_HOME=$HOME/.config

typeset -U path
path=(
    /usr/local/bin
    /usr/sbin
    /sbin
    $HOME/bin
    $path
)
export PATH

export EDITOR=nvim

# export FPATH=~/.ghq/github.com/suzuki-shunsuke/zsh.conf:$FPATH
# export FPATH="$HOME/.ghq/github.com/suzuki-shunsuke/zsh.conf/functions:${FPATH}"

{{ local([
  "**/zprofile", "!zprofile",
  "!android-sdk/zprofile", "!dckrm/zprofile",
  "!dirssh/zprofile", "!google-cloud-sdk/zprofile",
  "!heroku/zprofile", "!vim-virtualenv/zprofile",
  "pyenv/zprofile", "pyenv-virtualenv/zprofile"]) }}
