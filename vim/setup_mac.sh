#!/usr/bin/env sh

# Script to setup Vim.
# Assumes appropriate Vim already installed.

# Install neovim (works better with YouCompleteMe)
brew install neovim/neovim/neovim
# These needs to be installed for individual virtualenv
sudo pip2 install neovim
sudo pip3 install neovim

# Note that CTRL-h in neovim behaves as backspace
# See following for details
https://github.com/neovim/neovim/issues/2294

# Backup existing configuration
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi

# Get Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Get my .vimrc
wget https://github.com/lightalchemist/env/raw/master/vim/.vimrc_mac
cp .vimrc_mac ~/.vimrc

# Create symlinks for neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim 

# Vundle install plugins
vim +PluginInstall +qall

# Remember to manually run any install scripts for plugins (e.g., YouCompleteMe) if necessary.
# ./install.py --clang-completer
# And copy the .ycm_extra_conf.py file to ~/.vim/
