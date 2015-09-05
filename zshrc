

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(python git youtube-dl ubuntu brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/source/depot_tools:/home/jeff/.local/bin:/home/jeff/jython/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH
#export EDITOR=/usr/bin/zile

#alias nano=$EDITOR

# for jar in /usr/share/java/*.jar ; do
# 	export JYTHONPATH="$JYTHONPATH:$jar"
# done

#
for jar in $HOME/jars/*.jar ; do
	export CLASSPATH="$CLASSPATH:$jar"
done

export JYTHONPATH="$CLASSPATH"
#export CLASSPATH="$JYTHONPATH"

export GEM_HOME=$HOME/.gem
export PATH=/usr/local/cuda/bin:$GEM_HOME/bin:$PATH
export PATH=$HOME/source/maven/bin:$PATH
export PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH
export MANPATH=$HOME/.local/share/man:/usr/share/man:/usr/local/share/man:/usr/man

#source $HOME/.sysidk/sysidk.rc
#alias vi=$HOME/local/bin/vim
#alias emacs=$HOME/local/bin/emacs

export PATH=$HOME/source/depot_tools:$PATH
source $HOME/.nvm/nvm.sh
export PATH=$HOME/i2p:$PATH


export GOPATH=$HOME/src/go
export GOROOT=$HOME/source/go
export GOOS=linux
export GOARCH=amd64
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH


export PATH=$HOME/scala/bin:$PATH

export TOOLCHAIN=$HOME/src/armtoolchain/toolchain

eval `dircolors $HOME/.dir_colors/default`
export STUDIO_JDK=/opt/jdk
eval `lesspipe`
readme() {
	case "$1" in 
	*.md)
		markdown $1 | w3m -T text/html
		;;
	*.rst)
		rst2html $1 | w3m -T text/html
	esac
}

#export PYENV_ROOT=$HOME/.pyenv
#export PATH=$PYENV_ROOT/bin:$PATH
#eval "$(pyenv init -)"

#export RPI_PREFIX=$HOME/source/rpi/prefix
#export PATH=$HOME/.shadow/bin:$HOME/source/rpi/toolchain/bin:$PATH
export PATH=$HOME/source/rpi-tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH
#export AWS_CREDENTIAL_FILE=$HOME/aws/credentials.csv

export PATH=$HOME/source/nacl_sdk:$PATH

export http_proxy=http://10.0.3.1:8118/
export https_proxy=http://10.0.3.1:8118/

export PATH=$HOME/local/bin:$PATH

export PATH="/home/jeff/tahoe/tahoe-lafs-i2p/bin:${PATH}"

export PATH=$HOME/.shadown/bin:$PATH

export USE_HOMEBREW='no'

# monotone
export LG2=en

#function zle-line-init () { echoti smkx }
#function zle-line-finish () { echoti rmkx }
#zle -N zle-line-init
#zle -N zle-line-finish

export TERM=xterm-256color
#export TERM=xterm
fpath=(/home/jeff/.linuxbrew/share/zsh-completions $fpath)
source /home/jeff/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


function brew () {
	if [ "x$USE_HOMEBREW" != "xyes" ] ; then
		export HELPDIR=/home/jeff/.linuxbrew/share/zsh/help
		export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
		export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
		export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
		export HOMEBREW_EDITOR=nano
		export USE_HOMEBREW="yes"
		echo "brew now enabled"
	fi
	$HOME/.linuxbrew/bin/brew $@
}
