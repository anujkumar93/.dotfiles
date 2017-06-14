#!/usr/bin/env bash

### bashrc


echo "--- Setting up bashrc ---"
if [[ -f $HOME/.bash_profile ]]; then
    echo "$HOME/.bash_profile already exists!"
else
    echo "source $HOME/.dotfiles/bash/bashrc_init" >> $HOME/.bash_profile
    echo "Making $HOME/.dotfiles/bash/local/"
    mkdir -p $HOME/.dotfiles/bash/local/
    echo "Creating $HOME/.dotfiles/bash/local/bash_aliases_local"
    echo "Creating $HOME/.dotfiles/bash/local/bash_paths_local"
    echo "Creating $HOME/.dotfiles/bash/local/bash_settings_local"
    touch $HOME/.dotfiles/bash/local/bash_aliases_local
    touch $HOME/.dotfiles/bash/local/bash_paths_local
    touch $HOME/.dotfiles/bash/local/bash_settings_local
fi


### vimrc
echo "--- Setting up vimrc ---"
if [[ -f $HOME/.vimrc ]]; then
    echo "$HOME/.vimrc already exists!"
else
    echo " * Creating a symbolic link"
    echo " ->  ln -sf .dotfiles/vim/vimrc ../.vimrc"
    ln -s .dotfiles/vim/vimrc ../.vimrc

    echo " * Installing vim plugins"
    bash vim/vim_module_setup.sh
fi

### Tools

echo "--- Downloading useful tools ---"
if which git 2>/dev/null >&2 ; then 
    if [[ ! -e $HOME/bin/bashmarks ]]; then
        echo "installing bashmarks"
        mkdir -p $HOME/bin
        cd $HOME/bin && git clone https://github.com/huyng/bashmarks.git && cd - 
    fi
else
    echo "git not found! install git and rerun this script again"
fi

#touch tmux/tmux.conf.local
#touch git/gitconfig.local