#!/bin/zsh

function percol-z-history () {
  local selected=$(z | perl -pne 's{^\d+\.*\d*\s+}{}' | percol --query "$LBUFFER")
  if [ -n "$selected" ]; then
      BUFFER="cd $selected"
      zle accept-line
  fi
  zle clear-screen
}
zle -N percol-z-history
