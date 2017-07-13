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

# export FPATH=~/.ghq/github.com/suzuki-shunsuke/zsh.conf:$FPATH
# export FPATH="$HOME/.ghq/github.com/suzuki-shunsuke/zsh.conf/functions:${FPATH}"

{% include 'gnu/zprofile' %}
{% include 'golang/zprofile' %}
{% include 'history/zprofile' %}
{% include 'nodebrew/zprofile' %}
{% include 'pyenv/zprofile' %}
{% include 'pyenv-virtualenv/zprofile' %}
{% include 'rbenv/zprofile' %}
{% include 'ssh-agent/zprofile' %}
{% include 'vim-virtualenv/zprofile' %}
{% include 'virtualenvwrapper/zprofile' %}
{% include 'zplug/zprofile' %}
{#
  {% include 'android-sdk/zprofile' %}
  {% include 'dckrm/zprofile' %}
  {% include 'dirssh/zprofile' %}
  {% include 'google-cloud-sdk/zprofile' %}
  {% include 'heroku/zprofile' %}
#}
