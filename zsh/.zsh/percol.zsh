#!/bin/zsh

for f (~/.zsh/percol-sources/*) source "${f}"

bindkey '^r' percol-select-history
bindkey '^x^b' percol-git-recent-branches
bindkey '^xb' percol-git-recent-all-branches
bindkey '^x^l' percol-z-history
bindkey '^x^a' percol-chrome-all-tab-list
