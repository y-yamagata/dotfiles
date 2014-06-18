
autoload -Uz colors; colors

autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
fpath=(~/.zsh-completions/src $fpath)

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' formats '(%b %c%u)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a %c%u)'

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]=" $vcs_info_msg_0_"
}
PROMPT='[%F{green}%n@%m%f]%1(v|%F{red}%1v%f|) %# '
RPROMPT='%F{cyan}%~%f'

setopt print_eight_bit
setopt no_beep
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt correct
setopt extended_glob
setopt hist_ignore_all_dups

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

alias ls='ls -G --color'
alias ll='ls -l -h'
alias la='ls -a'
alias l1='ls -1'
alias grep='grep --color'

