setopt auto_cd

# 補完のやつ
autoload -U compinit
compinit


# カラー表示
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=32:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ショートカット
case ${OSTYPE} in
    linux*)
        alias ls='ls --color=auto --group-directories-first'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
alias ll='ls -lh'
alias la='ls -lAh'
alias rails='bundle exec rails'

# zsh-completionsの設定
fpath=(/usr/local/share/zsh-completions $fpath)

# 色を使用可能にする
autoload -Uz colors
colors

# 左のプロンプトの設定 -------------------------------------------

export PS1='\[\e[34m\]\W $\[\e[0m\] '
local p_cdir="%{${fg[blue]}%}[%~]%{${reset_color}%}"$'\n'
local p_info="${WINDOW:+"[$WINDOW]"}"
local p_mark="%B%{${fg[green]}%}%(!,#,>)%{${reset_color}%}%b"
PROMPT=" $p_cdir$p_info $p_mark "

# 右のプロンプトの設定 -------------------------------------------

RPROMPT="%{${fg[yellow]}%}[%T]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'$RPROMPT

# sublime textのショートカット -----------------------------------------

subl(){
    if [ $# -ge 1 ] ; then
        subli -b $@
    else
        subli & exit
    fi
}

# zplug -----------------------------------------------------------------

# source ~/.zplug/init.zsh


