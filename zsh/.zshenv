# java
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=/Users/tmaeda/ant
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)";

# python
export PATH=$HOME/.pyenv/shims:$PATH
eval "$(pyenv init -)";

# php
export PATH=$HOME/.composer/vendor/bin:$PATH
if [ -f ~/.phpbrew/bashrc ]; then
    source ~/.phpbrew/bashrc
fi

# js(node)
export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$NODEBREW_ROOT/current/bin:$PATH

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
