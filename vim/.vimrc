" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#incubate()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

"Must set this to enable 256 color support
"if $COLOR_TERM == 'gnome-terminal'
"    then
"    set t_Co=256
"endif

set t_Co=256
colorscheme distinguished

set nocompatible

""""""""""""""""""""""""""""""""""""""""""
"" SEARCH, HIGHLIGHT, SPELLING, ETC.
""""""""""""""""""""""""""""""""""""""""""
"The following lets searches be incremental.  So in normal mode, /sec will go to the first 'section', for example.  I don't have to type /section for that:
set incsearch 

"Highlight things that we find with search
set hlsearch!
nnoremap <C-h> :set hlsearch!<CR>

"Turn syntax highlighting on.  (This helps you know when you leave a brace open!):
syntax on

" Vim window stuff
"I'm pretty sure this makes wrapped lines break at spaces, not in the middle of words:
set linebreak

"Soft wrap long lines
set wrap 

"This turns off physical line wrapping (i.e. auto insertion of newlines)
"set textwidth=0 wrapmargin=0

"I like to see line numbers:
set number

"Highlight the line that the cursor is on:
set cursorline

"paragraph formatting stuff:
"This tells Vim to use an external program, Par, to format my paragraphs.  This comes from www.vimcasts.org
set formatprg=par

"I don't recall where this came from, but it makes Vim put all its backup and temporary files in places I don't mind:
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

""""""""""""""""""""""""""""""
" GENERIC PLUGIN BEHAVIOR """"
""""""""""""""""""""""""""""""
"Allows for plugins to do smart indentation (I think!):
filetype plugin indent on

"I think this lets you use filetype specific plugins:
" filetype plugin on

"To be frank, offhand I don't know exactly what these two do.  The first does something with the Omni Complete function, which is very helpful.  The second does something when you have a file open in Vim and then open it with another program and make changes.  I think this makes Vim update its version of the file:
set ofu=syntaxcomplete#Complete
set autoread

""""""""""""""
" SPACING """"
""""""""""""""  
"If you are indented and start a new line, this makes the new line indented, too:
set autoindent

"This it makes some sort of autoindenting occur, like when you have an open { at the end of a line.  I'm not sure I love this, so it might not last long:  
set smartindent
set preserveindent

"These deal with what the TAB key inserts.  I set my tabs to be only two spaces wide (default is 4).  The second one makes sure the shift function knows this (you use that by selecting some text and hitting > for multiple lines and >> for a single line.  The last one converts TAB characters into spaces instead of TAB characters.  (Apparently this is big to programmers, I use it to follow conventions in the Ruby programming language.
set tabstop=4 shiftwidth=4 expandtab

set scrolloff=5

"""""""""""""""
"""" FOLDS """"
"""""""""""""""
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Specify a column-width for fold markers:
set foldcolumn=4

"I want to mark folds manually.  So in a .tex file I can write %{{{ to start a section and %}}} to close it.  Then a zc in normal mode will shrink the whole section to one line.  Very tidy.
set foldmethod=manual "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)

""""""""""""""""
" KEYMAP STUFF "
""""""""""""""""

"If you have wrapped lines, k will take you to the next line, which likely means the next paragraph.  gk will take you down what you think of as one line.  If you want that to be the default, then some of these mappings will do that.

noremap <up> gk 
noremap <down> gj

"noremap <silent> <leader>w :call ToggleWrap()<cr>
"function ToggleWrap()
"  if &wrap
"    echo "Wrap OFF"
"    setlocal nowrap
"    set virtualedit=all
"    silent! nunmap <buffer> <up>
"    silent! nunmap <buffer> <down>
"    silent! nunmap <buffer> <home>
"    silent! nunmap <buffer> <end>
"    silent! iunmap <buffer> <up>
"    silent! iunmap <buffer> <down>
"    silent! iunmap <buffer> <home>
"    silent! iunmap <buffer> <end>
"  else
"    echo "Wrap ON"
"    setlocal wrap linebreak nolist
"    set virtualedit=
"    setlocal display+=lastline
"    noremap  <buffer> <silent> <up>   gk
"    noremap  <buffer> <silent> <down> gj
"    noremap  <buffer> <silent> <home> g<home>
"    noremap  <buffer> <silent> <end>  g<end>
"    inoremap <buffer> <silent> <up>   <c-o>gk
"    inoremap <buffer> <silent> <down> <c-o>gj
"    inoremap <buffer> <silent> <home> <c-o>g<home>
"    inoremap <buffer> <silent> <end>  <c-o>g<end>
"  endif
"endfunction

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

"This lets you use your mouse
set mouse=a

set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

"Operations for copy and paste will work with OS clipboard. No need to prefix 
"with '+' or *
set clipboard=unnamed

" nnoremap <F2> :set invpaste paste?<CR>
" set pastetoggle=<F2>
nnoremap <C-P> :set invpaste paste?<CR>
set pastetoggle=<C-P>
set showmode

map <S-Enter> O<Esc>j
map <CR> o<Esc>k

"Show commands
set showcmd

"Map jj to Esc key
inoremap jj <Esc>

"Set incremental search
set incsearch
"Case insensitive search
set ic

"Map ';' to ':'
nore ; :
"Map ',' to ';'
nore , ;

set ignorecase
set smartcase

set ruler

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%==%c,%l/%L\ %P
let g:SuperTabDefaultCompletionType = "context"

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" This is suppose to auto source vimrc file after editing and saving it.
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete over line breaks, or automatically-inserted indentation, or the place where insert mode started:
set backspace=indent,eol,start

let g:jedi#popup_on_dot = 0

let mapleader = ","
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>

nnoremap <C-/> gcc
