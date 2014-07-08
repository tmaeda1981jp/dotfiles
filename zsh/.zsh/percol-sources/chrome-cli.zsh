#!/bin/zsh

function percol-chrome-all-tab-list () {
  local selected="$(chrome-cli list tabs | percol --query "$LBUFFER")"
  if [ -n "$selected" ]; then
      echo ${selected} | perl -pne 's{^\[.*?:*(\d{1,4})\].*}{$1}' | xargs chrome-cli activate -t
      zle accept-line
  fi
  zle clear-screen
}
zle -N percol-chrome-all-tab-list
