# カラー・補完 ----------------------------------------------------------------

setopt auto_cd

# 補完のやつ
autoload -U compinit
compinit

# zsh-completionsの設定
fpath=(/usr/local/share/zsh-completions $fpath)

# 色を使用可能にする
autoload -Uz colors
colors

# カラー表示
#export LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLORS='di=34:ln=32:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# ショートカット --------------------------------------------------------------

case ${OSTYPE} in
    linux*)
        alias ls='ls --color=auto --group-directories-first'
        ;;
    darwin*)
        alias ls='ls -G'
        ;;
esac
alias la='ls -Ah'
alias ll='ls -lh'
alias lla='ls -lAh'

alias rails='bundle exec rails'
alias be='bundle exec'

alias gs='git status'

alias history-all='history -E 1'

# プロンプト ------------------------------------------------------------------

# 2段 ----------------------------------------------------------
# 左
local p_cdir="%{${fg[blue]}%}[%~]%{${reset_color}%}"$'\n'
local p_info="${WINDOW:+"[$WINDOW]"}"
local p_mark="%B%{${fg[green]}%}%(!,#,>)%{${reset_color}%}%b"
PROMPT=" $p_cdir$p_info $p_mark "

# 右
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

# 1段 ----------------------------------------------------------
# 左
#local p_name="%{${fg[blue]}%}[%n@%m]%{${reset_color}%}"
#local p_info="${WINDOW:+"[$WINDOW]"}"
#local p_mark="%B%{${fg[green]}%}%(!,#,>)%{${reset_color}%}%b"
#PROMPT="$p_name $p_mark "

# 右
#RPROMPT="%{${fg[yellow]}%}[%c]%{${reset_color}%}"
#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
#zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () { vcs_info }
#RPROMPT='${vcs_info_msg_0_}'$RPROMPT

# manページの色付け -----------------------------------------------------------

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
    }

export HOMEBREW_GITHUB_API_TOKEN=your_token_here


# zplug ----------------------------------------------------------------------
#source ~/.zplug/init.zsh

## Make sure to use double quotes
#zplug "zsh-users/zsh-history-substring-search"

## Use the package as a command
## And accept glob patterns (e.g., brace, wildcard, ...)
#zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

## Can manage everything e.g., other person's zshrc
#zplug "tcnksm/docker-alias", use:zshrc

## Disable updates using the "frozen" tag
#zplug "k4rthik/git-cal", as:command, frozen:1

## Grab binaries from GitHub Releases
## and rename with the "rename-to:" tag
#zplug "junegunn/fzf-bin", \
    #from:gh-r, \
    #as:command, \
    #rename-to:fzf, \
    #use:"*darwin*amd64*"

## Supports oh-my-zsh plugins and the like
#zplug "plugins/git",   from:oh-my-zsh

## Also prezto
#zplug "modules/prompt", from:prezto

## Load if "if" tag returns true
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

## Run a command after a plugin is installed/updated
## Provided, it requires to set the variable like the following:
## ZPLUG_SUDO_PASSWORD="********"
#zplug "jhawthorn/fzy", \
    #as:command, \
    #rename-to:fzy, \
    #hook-build:"make && sudo make install"

## Supports checking out a specific branch/tag/commit
#zplug "b4b4r07/enhancd", at:v1
#zplug "mollifier/anyframe", at:4c23cb60

## Can manage gist file just like other packages
#zplug "b4b4r07/79ee61f7c140c63d2786", \
    #from:gist, \
    #as:command, \
    #use:get_last_pane_path.sh

## Support bitbucket
#zplug "b4b4r07/hello_bitbucket", \
    #from:bitbucket, \
    #as:command, \
    #use:"*.sh"

## Rename a command with the string captured with `use` tag
#zplug "b4b4r07/httpstat", \
    #as:command, \
    #use:'(*).sh', \
    #rename-to:'$1'

## Group dependencies
## Load "emoji-cli" if "jq" is installed in this example
#zplug "stedolan/jq", \
    #from:gh-r, \
    #as:command, \
    #rename-to:jq
#zplug "b4b4r07/emoji-cli", \
    #on:"stedolan/jq"
## Note: To specify the order in which packages should be loaded, use the defer
##       tag described in the next section

## Set the priority when loading
## e.g., zsh-syntax-highlighting must be loaded
## after executing compinit command and sourcing other plugins
## (If the defer tag is given 2 or above, run after compinit command)
#zplug "zsh-users/zsh-syntax-highlighting", defer:2

## Can manage local plugins
#zplug "~/.zsh", from:local

## Load theme file
#zplug 'dracula/zsh', as:theme

## Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
    #printf "Install? [y/N]: "
    #if read -q; then
        #echo; zplug install
    #fi
#fi

## Then, source plugins and add commands to $PATH
#zplug load --verbose
#
