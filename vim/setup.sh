#!/usr/bin/env sh

# Script to setup Vim.
# Assumes appropriate Vim already installed.

# Backup existing configuration
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi

# Get Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Get my .vimrc
wget https://github.com/lightalchemist/env/raw/master/vim/.vimrc

cp .vimrc ~

# Vundle install plugins
vim +PluginInstall

# Remember to manually run any install scripts for plugins (e.g., YouCompleteMe) if necessary.
# ./install.py --clang-completer
# And copy the .ycm_extra_conf.py file to ~/.vim/
