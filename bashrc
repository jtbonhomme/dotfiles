#• PS1="\h:\W \u\$(parse_git_branch)\$ "

# Sets G7 Home Directory
G7_HOME=~/Developpements/r7
G7_API=$G7_HOME/api
G7_TESTAPP=$G7_HOME/testapp
G7_WEBAPP=$G7_HOME/webapp
G7_TOOLS=$G7_HOME/testapp/g7-tools
G7_IAPP=$G7_HOME/iApp

# Box References
G7_IP_BOX="10.0.1.184"
G7_ZERCONF_NAME_BOX="G7 DEV JTB"

# Aliases
alias "gapi"="cd $G7_API"
alias "gtapp"="cd $G7_TESTAPP"
alias "gwapp"="cd $G7_WEBAPP"
alias "gbox"="ssh root@$G7_IP_BOX"
alias "gtools"="cd $G7_TOOLS"
alias "ggithub"="open -a Google\ Chrome.app https://github.com/canalplus/"
alias "gapidoc"="open -a Google\ Chrome.app http://gustave.canallabs/docs/restapi/"

# Functional aliases
alias "grefresh"="g7_refresh_webapp"
alias "gprimo"="g7_reload_primo"

# Curl tools
alias "gput"='curl -X PUT -H "Content-Type: application/json "'
alias "gpost"='curl -X POST -H "Content-Type: application/json  "'

# Add G7-TOOLS to path
export PATH=$G7_TOOLS:$PATH
export BOX_IP=$G7_IP_BOX
export BOX_PORT=8184

# Functions

# g7_refresh_webapp
# Refresh webapp on http://127.0.0.1
g7_refresh_webapp(){
ssh -n root@$G7_IP_BOX 'pkill -9 qtwebkitlauncher && nohup launch qt -t http://127.0.0.1/ >/dev/null 2>&1 &'
}

# g7_reload_primo
# Reset to primo install
# g7_refresh_webapp to apply conf
g7_reload_primo(){
curl -X DELETE $G7_IP_BOX/install
}

# g7_create_ssh_tunnel
# Create an ssh tunnel between
# machine an STB
g7_create_ssh_tunnel(){
    ssh -o StrictHostKeyChecking=no -f -N -L $BOX_PORT:$BOX_IP:80 root@$BOX_IP
}
# aliases
alias ..="cd .."
alias l="ls -al"
alias ll="ls -als"
alias lp="ls -p"
alias h=history
alias tt="echo test"

# the "kp" alias ("que pasa")
alias kp="ps auxwww"

# no duplicates in bash history
export HISTCONTROL=ignoredups

############################################
 # Modified from emilis bash prompt script
 # from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
 #
 # Modified for Mac OS X by
 # @corndogcomputer
 ########################################### 
# Fill with minuses
 # (this is recalculated every time the prompt is shown in function prompt_command):
 fill="--- "

 
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black
# Prompt variable:

# configure my multi-line prompt

PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\w
$(parse_git_branch) \$ '"$command_style "

#PS1='
#$PWD 
#[$(parse_git_branch)] \$ '

# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG
 
function prompt_command {
 
# create a $fill of all screen width minus the time string and a space:
 let fillsize=${COLUMNS}-9
 fill=""
 while [ "$fillsize" -gt "0" ]
 do
 fill="-${fill}" # fill with underscores to work on
 let fillsize=${fillsize}-1
 done
 
# If this is an xterm set the title to user@host:dir
 case "$TERM" in
 xterm*|rxvt*)
 bname=`basename "${PWD/$HOME/~}"`
 echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
 ;;
 *)
 ;;
 esac
 
}
PROMPT_COMMAND=prompt_command


################################################
# bash functions
################################################
function myip {
  res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  echo "$res"
}

function git_stats {
# awesome work from https://github.com/esc/git-stats
# including some modifications
if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
    echo "Number of commits per author:"
    git --no-pager shortlog -sn --all
    AUTHORS=$( git shortlog -sn --all | cut -f2 | cut -f1 -d' ')
    LOGOPTS=""
    if [ "$1" == '-w' ]; then
        LOGOPTS="$LOGOPTS -w"
        shift
    fi
    if [ "$1" == '-M' ]; then
        LOGOPTS="$LOGOPTS -M"
        shift
    fi
    if [ "$1" == '-C' ]; then
        LOGOPTS="$LOGOPTS -C --find-copies-harder"
        shift
    fi
    for a in $AUTHORS
    do
        echo '-------------------'
        echo "Statistics for: $a"
        echo -n "Number of files changed: "
        git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f3 | sort -iu | wc -l
        echo -n "Number of lines added: "
        git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f1 | awk '{s+=$1} END {print s}'
        echo -n "Number of lines deleted: "
        git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f2 | awk '{s+=$1} END {print s}'
        echo -n "Number of merges: "
        git log $LOGOPTS --all --merges --author=$a | grep -c '^commit'
    done
else
    echo "you're currently not in a git repository"
fi
}

function crc32 { cksum -o3 "$@"|ruby -e 'STDIN.each{|a|a=a.split;printf  "%08X\t%s\n",a[0],a[2..-1].join(" ")}'; }

function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "("${ref#refs/heads/}")" 
}

