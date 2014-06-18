# java
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=/Users/tmaeda/ant
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

# python
export PATH=$HOME/.pyenv/shims:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# php
export PATH=$HOME/.phpenv/bin:$PATH
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi

# js(node)
export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$NODEBREW_ROOT/current/bin:$PATH

# haskell
export HASKELL_HOME=$HOME/Library/Haskell
export PATH=$HASKELL_HOME/bin:$PATH

# android
export ANDROID_HOME=$HOME/adt-bundle-mac-x86_64/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# tex
export TEXPATH=/usr/local/texlive/2012/bin/universal-darwin
export PATH=$TEXPATH:$PATH

export PATH=$HOME/bin:/usr/local/bin:$PATH
