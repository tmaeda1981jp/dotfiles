# java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export _JAVA_OPTIONS=-Dfile.encoding=UTF-8
export PATH=$JAVA_HOME/bin:$PATH

# python
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# js(node)
[[ -s "$HOME/nvm/nvm.sh" ]] && source "$HOME/nvm/nvm.sh"
export NODE_VERSION=0.10.0
export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
export PATH=$NODE_PATH/bin:$PATH

# haskell
export HASKELL_HOME=$HOME/Library/Haskell
export PATH=$HASKELL_HOME/bin:$PATH

# android
export ANDROID_HOME=/Developer/android-sdk-mac_x86/tools:/Developer/android-sdk-mac_x86/platform-tools
export PATH=$ANDROID_HOME:$PATH

# tex
export TEXPATH=/usr/local/texlive/2012/bin/universal-darwin
export PATH=$TEXPATH:$PATH

export PATH=$HOME/bin:/usr/local/bin:$PATH
