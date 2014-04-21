#!/bin/bash

# emacs
if [ -e $HOME/.emacs.d ]; then
    rm -f $HOME/.emacs.d
fi
ln -s `PWD`/emacs $HOME/.emacs.d

# percol
if [ -e $HOME/.percol.d ]; then
    rm -f $HOME/.percol.d
fi
ln -s `PWD`/percol $HOME/.percol.d

# zsh
ln -s `PWD`/zsh/.zshrc $HOME/.zshrc
ln -s `PWD`/zsh/.zshenv $HOME/.zshenv

# vim
ln -s `PWD`/vim/.vimrc $HOME/.vimrc

# git
ln -s `PWD`/git/.gitignore $HOME/.gitignore
ln -s `PWD`/git/.gitconfig $HOME/.gitconfig

# gem
ln -s `PWD`/gem/.gemrc $HOME/.gemrc

# tmux
ln -s `PWD`/tmux/.tmux.conf $HOME/.tmux.conf

# bower
ln -s `PWD`/bower/.bowerrc $HOME/.bowerrc

# bpython
ln -s `PWD`/bpython/config $HOME/.config/bpython/config

# ag
ln -s `PWD`/ag/.agignore $HOME/.agignore

# ghci
ln -s `PWD`/ghci/.ghci $HOME/.ghci
