#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='joe'
export VISUAL='joe'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

export PATH=$PATH:$HOME/bin/
export PATH=$PATH:/Users/robert/pebble-dev/PebbleSDK-current/bin
export PATH=$PATH:/Users/rbartl/devel/mysql/bin

export PATH=$PATH:/Users/robert/bin/
export PATH=$PATH:/Users/robert/devel/mysql/bin
export PATH=$PATH:/Applications/packer

export PATH="/Users/rbartl/devel/android-sdk-macosx/platform-tools:$PATH"
export PATH=/usr/local/opt/openssl/bin:$PATH

export NODE_PATH=~/workspaces/node_modules:$NODE_PATH

export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
export GOPATH=/Users/robert/workspaces/gopath

alias dir="ls -l -G"
alias vdir="ls -l -G"

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

unalias cp 2> /dev/null

alias rsync="rsync --progress --partial" 
unsetopt noclobber

unalias rsync

unsetopt nomatch
setopt clobber


#export VAGRANT_DEFAULT_PROVIDER=parallels

if [ -n "$WINDIR" ]; then 
  export JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_60"
  keychain $HOME/.ssh/id_rsa
  source $HOME/.keychain/magma-sh
fi


export BC_ENV_ARGS=~/.bcrc


##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

