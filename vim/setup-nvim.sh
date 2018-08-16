#!/usr/bin/env sh

# Script to setup Vim.
# Assumes appropriate Vim already installed.

# Backup existing configuration

if [ -e ~/.config/nvim ]; then 
    mv ~/.config/nvim ~/.config/nvim_bak;
fi
mkdir -p ~/.config/nvim;

if [ -e ~/.config/nvim/init.vim ]; then
    mv ~/.config/nvim/init.vim ~/.config/nvim/init_bak.vim;
fi
cp init.vim ~/.config/nvim/
ln -s ~/.config/nvim/init.vim ~/.vimrc


# Get Vundle
git clone https://github.com/gmarik/vundle.git ~/.config/nvim/vundle
ln -s ~/.config/nvim ~/.vim

# Vundle install plugins
vim +PluginInstall +qall

# Remember to manually run any install scripts for plugins (e.g., YouCompleteMe) if necessary.
# ./install.py --clang-completer
# And copy the .ycm_extra_conf.py file to ~/.vim/
