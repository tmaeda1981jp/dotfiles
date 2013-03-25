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

# python
alias pb='pythonbrew'
alias pbv='pythonbrew venv'
alias pbvc='pythonbrew venv create'
alias pbvu='pythonbrew venv use'
alias pbvd='pythonbrew venv delete'
alias pf='pip freeze'
alias pm='python manage.py'
alias pmsdb='python manage.py syncdb'
alias pms='python manage.py shell'

# js
alias node='nocorrect node'
alias n='node'
alias nb='nodebrew'
alias b='bower'

# git/svn
export EDITOR='e'

# git
alias g='git'
alias glog='g log1'
alias gff='g flow feature'
alias gfr='g flow release'
alias ga='g add .'
alias gc='g ci -m'
alias gp='g push'
alias gpm='g push origin master'
alias gst='g st'

# tmux
alias tls='tmux ls'
alias ta='tmux attach-session -t'

# other
alias fu='nocorrect fu'

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

# zaw
source /Users/tmaeda/zaw/zaw.zsh

# z
. /Users/tmaeda/z/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

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
