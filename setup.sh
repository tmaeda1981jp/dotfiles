#!/bin/bash

# zsh
ln -sf `PWD`/zsh/.zshrc $HOME/.zshrc
ln -sf `PWD`/zsh/.zshenv $HOME/.zshenv

# anyenv
if [ ! -d ${HOME}/.anyenv ] ; then
    git clone https://github.com/riywo/anyenv ~/.anyenv

    exec $SHELL -l

    anyenv install rbenv
    anyenv install pyenv
    anyenv install ndenv

    exec $SHELL -l

    # rbenv
    rbenv install 2.1.0
    rbenv global 2.1.0

    # pyenv
    pyenv install 2.7.8
    pyenv global 2.7.8

    # ndenv
    ndenv install 0.10.35
    ndenv global 0.10.35

    #gem
    gems=(
        bundler
        brewdler
        tmuxinator
        jekyll
        middleman
        compass
        sass
        rails
        rspec
        cocoapods
    )
    for gem in ${gems[@]};
    do
        gem install ${gem} --no-ri --no-rdoc
    done
    rbenv rehash

    # pip
    pip install percol ansible virtualenv django
    pyenv rehash

    # npm
    npm install bower grunt-cli volo jade mocha browserify jslint jshint gulp yo strongloop
    ndenv rehash
else
    echo -e "\033[1m[SKIPPED]\033[0m anyenv has been already installed"
fi

# 時間がかかるのであとでうまくやる方法を考える
# とりあえずanyenvと一緒にやる

# gem
# gems=(
#     bundler
#     brewdler
#     tmuxinator
#     jekyll
#     middleman
#     compass
#     sass
#     rails
#     rspec
# )
# for gem in ${gems[@]};
# do
#     gem install ${gem} --no-ri --no-rdoc
# done
# rbenv rehash

# # pip
# pip install percol ansible virtualenv django
# pyenv rehash

# # npm
# npm install bower grunt-cli volo jade mocha browserify jslint jshint gulp yo strongloop
# ndenv rehash


# homebrew
if [ ! -x /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "\033[1m[SKIPPED]\033[0m Homebrew has been already installed"
fi

# brewfile
if [ ! -x $HOME/.anyenv/envs/rbenv/shims/brewdle ]; then
    ln -sf `PWD`/osx/Brewfile $HOME/Brewfile
    cd $HOME
    brewdle install
    brew cask alfred link
    cd $HOME/dotfiles
else
    echo -e "\033[1m[SKIPPED]\033[0m Brewdler has been already installed"
fi

# emacs
if [ -e $HOME/.emacs.d ]; then
    rm -rf $HOME/.emacs.d
fi
ln -sf `PWD`/emacs $HOME/.emacs.d
ln -sf /usr/local/opt/cask $HOME/.cask
cd $HOME/dotfiles/emacs
cask install
cd $HOME/dotfiles

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
if [ -e $HOME/.tmuxinator ]; then
    rm -rf $HOME/.tmuxinator
fi
ln -sf `PWD`/tmux/tmuxinator $HOME/.tmuxinator

# bower
ln -sf `PWD`/bower/.bowerrc $HOME/.bowerrc

# python
if [ ! -d $HOME/.config/bpython ]; then
    mkdir -p $HOME/.config/bpython
fi
ln -sf `PWD`/python/bpython/config $HOME/.config/bpython/config
ln -sf `PWD`/python/pylint/.pylintrc $HOME/.pylintrc

# ruby
## gem
ln -sf `PWD`/ruby/gem/.gemrc $HOME/.gemrc

## rubocop
ln -sf `PWD`/ruby/rubocop/.rubocop.yml $HOME/.rubocop.yml

## rspec
ln -sf `PWD`/ruby/rspec/.rspec $HOME/.rspec

# php
## boris
ln -sf `PWD`/php/boris/.borisrc $HOME/.borisrc

# htmltidy
ln -sf `PWD`/html/.tidyrc $HOME/.tidyrc

# ag
ln -sf `PWD`/ag/.agignore $HOME/.agignore

# ghci
ln -sf `PWD`/ghci/.ghci $HOME/.ghci

# percol
if [ -e $HOME/.zsh ]; then
    rm -rf $HOME/.zsh
fi
ln -sf `PWD`/zsh/.zsh $HOME/.zsh
