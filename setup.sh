#!/bin/bash

# emacs
if [ -e $HOME/.emacs.d ]; then
    rm -rf $HOME/.emacs.d
fi
ln -sf `PWD`/emacs $HOME/.emacs.d

# percol
if [ -e $HOME/.percol.d ]; then
    rm -rf $HOME/.percol.d
fi
ln -sf `PWD`/percol $HOME/.percol.d

# vim
ln -sf `PWD`/vim/.vimrc $HOME/.vimrc

# git
ln -sf `PWD`/git/.gitignore $HOME/.gitignore
ln -sf `PWD`/git/.gitconfig $HOME/.gitconfig

# tmux
ln -sf `PWD`/tmux/.tmux.conf $HOME/.tmux.conf

# bower
ln -sf `PWD`/bower/.bowerrc $HOME/.bowerrc

# python
if [ ! -d $HOME/.config/bpython ]; then
    mkdir -p $HOME/.config/bpython
fi
ln -sf `PWD`/python/bpython/config $HOME/.config/bpython/config
ln -sf `PWD`/python/pylint/.pylintrc $HOME/.pylintrc

# gem
ln -sf `PWD`/ruby/gem/.gemrc $HOME/.gemrc

# rubocop
ln -sf `PWD`/ruby/rubocop/.rubocop.yml $HOME/.rubocop.yml

# htmltidy
ln -sf `PWD`/html/.tidyrc $HOME/.tidyrc

# ag
ln -sf `PWD`/ag/.agignore $HOME/.agignore

# ghci
ln -sf `PWD`/ghci/.ghci $HOME/.ghci

# zsh
ln -sf `PWD`/zsh/.zshrc $HOME/.zshrc
ln -sf `PWD`/zsh/.zshenv $HOME/.zshenv

# percol
if [ -e $HOME/.zsh ]; then
    rm -rf $HOME/.zsh
fi
ln -sf `PWD`/zsh/.zsh $HOME/.zsh
