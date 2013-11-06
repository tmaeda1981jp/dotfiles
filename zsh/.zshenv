# java
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_HOME=$(/usr/libexec/java_home)
#export _JAVA_OPTIONS=-Dfile.encoding=UTF-8
export ANT_HOME=/Users/tmaeda/ant
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

# python
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

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

export PATH=$HOME/bin:/usr/local/bin:$PATH:
