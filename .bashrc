# .bashrc

# エイリアスの設定
# ls（カラー表示）
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias be='bundle exec'

# プロンプトの設定
# export PS1='\[\e[34m\]\W $\[\e[0m\] '

# export PS1='\n\[\e[0;34m\]\w\[\e[0m\]\n\[\e[0;31m\]> \[\e[0m\]'


subl(){
    if [ $# -ge 1 ] ; then
        subli -b $@
    else
        subli & exit
    fi
}


if type __git_ps1 > /dev/null 2>&1 ; then
 # PROMPT_COMMAND="__git_ps1 '\h:\W \u' '\\\$ '; $PROMPT_COMMAND"
 # PROMPT_COMMAND="__git_ps1 '\n\[\e[0;34m\]\w\[\e[0m\]\n\[\e[0;31m\]> \[\e[0m\]' '\\\$ '; $PROMPT_COMMAND"

 GIT_PS1_SHOWDIRTYSTATE=true
 GIT_PS1_SHOWSTASHSTATE=true
 GIT_PS1_SHOWUNTRACKEDFILES=true
 GIT_PS1_SHOWUPSTREAM="auto"
 GIT_PS1_SHOWCOLORHINTS=true
fi


# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1='\n\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\[\e[0;31m\]\$ \[\e[0m\]'
