mv ~/.vim ~/.vim.bak
mkdir -p ~./vim/{autoload,bundle}

# Download pathogen

# Clone vim plugins into bundle
git clone git://git.wincent.com/command-t.git
git clone git://github.com/msanders/snipmate.vim.git
git clone git://github.com/scrooloose/nerdtree.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/wincent/Command-T.git
git clone https://github.com/tsaleh/vim-matchit.git
git clone https://github.com/tpope/vim-repeat.git 
git clone https://github.com/davidhalter/jedi-vim.git
