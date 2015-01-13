
source ~/.git-prompt.sh
source ~/.git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
PS1="\[\033[00m\][\[\033[32m\]\u@\h \[\033[34m\]\w\[\033[00m\]]\[\033[31m\]\$(__git_ps1)\[\033[00m\] \$ "
HISTTIMEFORMAT='%Y-%m-%d %T '
CLICOLOR=1
LSCOLOR=gxfxcxdxbxegedabagacad

if [ ${WWW_HOME-UNDEF} = 'UNDEF' ]; then
    export WWW_HOME='google.co.jp'
fi

alias ls='ls -G --color'
alias ll='ls -l -h'
alias la='ls -a'
alias l1='ls -1'
alias grep='grep --color'
alias w3m='w3m -cookie'
# alias ctags='/opt/local/bin/ctags'

# set -o vi

