autoload -Uz compinit
autoload -Uz colors
compinit

if [ -f ~/.zplug/init.zsh ]
then
    source ~/.zplug/init.zsh
fi

zstyle :zplug:tag depth 1

if [ $ZPLUG_HOME ]
then
    zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
    zplug "plugins/command-not-found", from:oh-my-zsh
    # zplug "themes/af-magic", from:oh-my-zsh
    zplug "zsh-users/zsh-completions"
    # compinit 以降に読み込むようにロードの優先度を変更する（10~19にすれば良い）
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "mollifier/cd-gitroot"
    zplug "mollifier/anyframe"
    zplug "mafredri/zsh-async", on:sindresorhus/pure
    zplug "sindresorhus/pure", use:pure.zsh, defer:2

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load  # --verbose
fi

alias sudo="sudo -E"
alias ls="gls --color=auto"

bindkey -v

# npm run aliases
NPM_ALIASES=(babel bower esdoc eslint express grunt gulp mocha rollup webpack webpack-dev-server pm2)
for i in $NPM_ALIASES
do
    alias $i="npm run $i"
done

# zmv
autoload -Uz zmv

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# vim
if builtin command -v vim > /dev/null; then
    alias vi="vim"
fi

# packer-io
if builtin command -v packer-io > /dev/null; then
    alias packer="packer-io"
fi

# dircolors
# if [ -f ~/.colorrc ]
# then
#     eval `dircolors ~/.colorrc`
# fi

# direnv
if builtin command -v direnv > /dev/null; then
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

# GVM(Go Version Manager)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# https://github.com/sindresorhus/pure#my-preprompt-is-missing-when-i-clear-the-screen-with-ctrll 
# Ctrl + L で pure の prepromptが消える問題への対応
zle -N clear-screen prompt_pure_clear_screen
