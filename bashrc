function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "("${ref#refs/heads/}")" 
}

#• PS1="\h:\W \u\$(parse_git_branch)\$ "

# aliases
alias ..="cd .."
alias l="ls -al"
alias ll="ls -als"
alias lp="ls -p"
alias h=history
alias tt="echo test"

# the "kp" alias ("que pasa"), in honor of tony p.
alias kp="ps auxwww"

# configure my multi-line prompt
PS1='
$PWD 
[\u] \$ '
