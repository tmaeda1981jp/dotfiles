#
# lang and colors
#
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors $LSCOLORS

#
# alias
#
alias ls='ls -G'
alias lsl='ls -l'
alias lsa='ls -ltra'
alias lstr='ls -ltr'
alias lsta='ls -ltra'
alias his='history 1'
alias grep='grep -n --color'
alias egrep='egrep -n --color'
alias fgrep='fgrep -n --color'
alias hisgrep='his | grep'
alias del='find . \( -name "*~" -o -name "#*" \) -print | xargs rm'
alias ag='nocorrect ag -S'
alias s='source'
alias o='open'
alias o.='open .'

alias less='/usr/share/vim/vim73/macros/less.sh'
alias ctags='/usr/local/bin/ctags'

alias emacssv="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacs="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
alias e='emacs'

alias gcc='nocorrect gcc'
alias js='nocorrect js'

alias ff='open -a Firefox'
alias ch='open -a Google\ Chrome'
alias sf='open -a Safari'
alias pv='open -a Preview'

# ruby
alias rspec='rspec -c'
alias r='rails'
alias rs='r s'
alias rg='r g'
alias rc='r c'
alias rgs='r g scaffold'
alias rake="noglob rake"

# python
alias bpython='nocorrect bpython'
alias bp='bpython'
alias pe='pyenv'
alias pr='pyenv rehash'
alias pls='pyenv versions'
alias pl='pyenv local'
alias pv='pyenv virtualenv'
alias pf='pip freeze'
alias pm='python manage.py'
alias pmsm='python manage.py schemamigration'
alias pmm='python manage.py migrate'
alias pmsdb='python manage.py syncdb'
alias pms='python manage.py shell'

# js
alias n='node'
alias nodebrew='nocorrect nodebrew'
alias npm='nocorrect npm'
alias nb='nodebrew'
alias b='bower'
alias volo='nocorrect volo'
alias grunt='nocorrect grunt'

# git/svn
export EDITOR='emacs'

# git
alias g='git'
alias ga='g add .'
alias gaa='g add -A .'
alias gc='g ci -m'
alias gca='g commit --amend'
alias gff='g flow feature'
alias gfr='g flow release'
alias gfh='g flow hotfix'
alias giff='git diff'
alias giffh='giff HEAD'
alias giffw='git diff --word-diff'
alias glog='g log1 --decorate'
alias glogn='glog --numstat'
alias gp='g push'
alias gpm='g push origin master'
alias gpd='g push origin develop'
alias gri='g rebase -i'
alias gsl='g stash list'
alias gss='g stash'
alias gst='g st'

# svn
alias sst='svn status'
svn_oneline() {
    svn log $1 | perl -l40pe 's/^-+/\n/'
}
alias slog=svn_oneline
delete_all_dot_svn() {
    find . -type d -name .svn -exec rm -rf {} +
}
alias delsvn=delete_all_dot_svn

# tmux
alias tls='tmux ls'
alias ta='tmux attach-session -t'
alias tn='tmux new -s'

# vagrant
alias vagrant='nocorrect vagrant'
alias v='vagrant'
alias vst='vagrant status'

# ios
alias iphone='open -a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# appium
function change_xcode {
  varsion=""
  if [ $1 -eq 5 ]; then;
    version=""
  elif [ $1 -eq 4 ]; then;
    version="46"
  else;
    echo "No such version."
    return 1
  fi
  sudo xcode-select -switch /Applications/Xcode$version.app/Contents/Developer/
  echo "Change XCode version..."
  xcode-select --print-path
}
alias xc4='change_xcode 4'
alias xc5='change_xcode 5'

# other
alias fu='nocorrect fu'
alias jq='nocorrect jq'
alias figlet='nocorrect figlet'

b2d() { echo "obase=10;ibase=2; $1" | bc }; alias b2d=b2d;
b2o() { echo "obase=8;ibase=2; $1"  | bc }; alias b2o=b2o;
b2h() { echo "obase=16;ibase=2; $1" | bc }; alias b2h=b2h;

d2b() { echo "obase=2;ibase=10; $1" | bc }; alias d2b=d2b;
d2o() { echo "obase=8;ibase=10; $1" | bc }; alias d2o=d2o;
d2h() { echo "obase=16;ibase=10; $1"| bc }; alias d2h=d2h;

o2b() { echo "obase=2;ibase=8; $1"  | bc}; alias o2b=o2b;
o2d() { echo "obase=10;ibase=8; $1" | bc}; alias o2d=o2d;
o2h() { echo "obase=16;ibase=8; $1" | bc}; alias o2h=o2h;

h2b() { echo "obase=2;ibase=16; $1" | bc }; alias h2b=h2b;
h2o() { echo "obase=8;ibase=16; $1" | bc }; alias h2o=h2o;
h2d() { echo "obase=10;ibase=16; $1"| bc }; alias h2d=h2d;

autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

#
# prompt
#
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{$fg_bold[green]%}%n %{$fg_bold[cyan]%}%~ %1(v|%F{yellow}%1v%f|) %{$reset_color%}
%{$fg[yellow]%}⚡%{$reset_color%} : "
SPROMPT="correct: %R -> %r ? "

#
# keybind configuration
# emacs like keybind
#
bindkey -e

#
# history
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload -U compinit
compinit

autoload zmv

setopt auto_cd
setopt correct
setopt list_packed
setopt nolistbeep

# z
#. /Users/tmaeda/.z/z.sh
. `brew --prefix`/etc/profile.d/z.sh

# percol
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(history -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

launchctl limit maxfiles 10480 10480
