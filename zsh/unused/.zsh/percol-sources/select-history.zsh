#!/bin/zsh

function percol-select-history() {
    BUFFER=$(history -n 1 | tail -r | percol --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N percol-select-history
