#
# common bashrc opts 
#


# set up secret env vars
source ~/.secrets.sh

# asdf
export DOTNET_CLI_TELEMETRY_OPTOUT=1
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# git prompt
eval "$(hub alias -s)"                                           
source ~/.git-prompt.sh 
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;5;57m\]$(__git_ps1 " (%s)")\
[\033[00m\] \$ '

# mtr 
export MTR_OPTIONS="--displaymode=1 -z -p -b -t -y 1"

# debian packages
export DEBEMAIL="Jeff Becker (probably not evil) <jeff@lokinet.io>"

# preferred utils
export SPELL=aspell
export EDITOR=emacsclient
