#!/bin/zsh

function percol-select-ssh () {
  local selected='$(cat ~/.ssh/config | /usr/bin/grep ^Host | sed -e "s/Host //" | percol --query "$LBUFFER")'
  if [ -n "$selected" ]; then
      BUFFER="ssh $selected"
      zle accept-line
  fi
  zle clear-screen
}
zle -N percol-select-ssh
