#!/bin/bash

# zsh
ln -sf `PWD`/zsh/.zshrc $HOME/.zshrc
ln -sf `PWD`/zsh/.zshenv $HOME/.zshenv

# anyenv
if [ ! -d ${HOME}/.anyenv ] ; then
    git clone https://github.com/riywo/anyenv ~/.anyenv

    source ~/.zshenv

    anyenv install rbenv
    anyenv install pyenv
    anyenv install ndenv

    source ~/.zshenv

    # rbenv
    rbenv install 2.5.0
    rbenv global 2.5.0

    # pyenv
    pyenv install 2.7.14
    pyenv install 3.6.4
    pyenv global 3.6.4

    # ndenv
    ndenv install 8.9.3
    ndenv install 9.3.0
    ndenv global 8.9.3

    # gem
    gems=(
        bundler
        tmuxinator
        jekyll
        middleman
        sinatra
        sinatra-reloader
    )
    for gem in ${gems[@]};
    do
        gem install ${gem} --no-ri --no-rdoc
    done
    rbenv rehash

    # pip
    pip install percol ansible virtualenv django pygments awscli
    pyenv rehash

    # npm
    npm install mocha eslint eslint-plugin-react babel-eslint gulp watchify envify uglifyjs nodemon create-react-app firebase-tools -g
    ndenv rehash
else
    echo -e "\033[1m[SKIPPED]\033[0m anyenv has been already installed"
fi

# rbenv-binstubs
if [ ! -d ${HOME}/.anyenv/envs/rbenv/plugins/rbenv-binstubs ] ; then
    git clone https://github.com/ianheggie/rbenv-binstubs.git ${HOME}/.anyenv/envs/rbenv/plugins/rbenv-binstubs
    rbenv rehash
else
    echo -e "\033[1m[SKIPPED]\033[0m rbenv-binstubs has been already installed"
fi

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
ln -sf `PWD`/git/.tigrc $HOME/.tigrc

# tmux
ln -sf `PWD`/tmux/.tmux.conf $HOME/.tmux.conf
if [ -e $HOME/.tmuxinator ]; then
    rm -rf $HOME/.tmuxinator
fi
ln -sf `PWD`/tmux/tmuxinator $HOME/.tmuxinator

# python
if [ ! -d $HOME/.config/bpython ]; then
    mkdir -p $HOME/.config/bpython
fi
ln -sf `PWD`/python/bpython/config $HOME/.config/bpython/config
ln -sf `PWD`/python/pylint/.pylintrc $HOME/.pylintrc

# ruby
## gem
ln -sf `PWD`/ruby/gem/.gemrc $HOME/.gemrc

# php
## boris
ln -sf `PWD`/php/boris/.borisrc $HOME/.borisrc

# ghci
ln -sf `PWD`/ghci/.ghci $HOME/.ghci

# percol
if [ -e $HOME/.zsh ]; then
    rm -rf $HOME/.zsh
fi
ln -sf `PWD`/zsh/.zsh $HOME/.zsh
