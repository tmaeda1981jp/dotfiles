# homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# java
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=/Users/tmaeda/ant
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

# go
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# anyenv
if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `/bin/ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# # ruby
# export PATH=$HOME/.rbenv/bin:$PATH
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # python
# export PATH=$HOME/.pyenv/shims:$PATH
# eval "$(pyenv init -)";

# # js(node)
# export NODEBREW_ROOT=$HOME/.nodebrew
# export PATH=$NODEBREW_ROOT/current/bin:$PATH

#hub
eval "$(hub alias -s)"

# gettext
export PATH=/usr/local/opt/gettext/bin:$PATH

# php
export PATH=$HOME/.composer/vendor/bin:$PATH
if [ -f ~/.phpbrew/bashrc ]; then
    source ~/.phpbrew/bashrc
fi

# haskell
export HASKELL_HOME=$HOME/Library/Haskell
export PATH=$HASKELL_HOME/bin:$PATH

# android
export ANDROID_HOME=$HOME/adt-bundle-mac-x86_64/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# genymotion
export PATH=/Applications/Genymotion.app/Contents/MacOS:$PATH

# tex
export TEXPATH=/usr/local/texlive/2012/bin/universal-darwin
export PATH=$TEXPATH:$PATH

# cask
export PATH=$HOME/.cask/bin:$PATH

# ~/bin, /usr/local/bin
export PATH=$PATH:$HOME/bin:/usr/local/bin

# coreutils
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin

# ansible
export ANSIBLE_HOSTS=~/ansible_hosts

# OCaml(opam)
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
