" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'

Bundle 'Raimondi/delimitMate'
Bundle 'klen/python-mode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/matchit.zip'
" Bundle 'vim-scripts/molokai'
" Bundle 'tomasr/molokai'
Bundle "lightalchemist/molokai"
Bundle 'jacquesbh/vim-showmarks'

Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Gundo'

Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tlib_vim'

filetype plugin indent on


" Pathogen
" filetype off " Pathogen needs to run before plugin indent on
" call pathogen#infect()
" call pathogen#incubate()
" call pathogen#helptags() " generate helptags for everything in 'runtimepath'
" filetype plugin indent on

"Must set this to enable 256 color support
set t_Co=256

" Hemisu theme
" colorscheme hemisu
" set background=dark
" Distinguished theme
" colorscheme distinguished
" Molokai color theme
let g:rehash256 = 1
colorscheme molokai
" Note that this should only be called after setting theme
" set background=light
" solarized theme
" let g:solarized_termcolors=256
" colorscheme solarized
" set background=dark

set nocompatible

""""""""""""""""""""""""""""""""""""""""""
"" SEARCH, HIGHLIGHT, SPELLING, ETC.
""""""""""""""""""""""""""""""""""""""""""
" The following lets searches be incremental.
" So in normal mode, /sec will go to the first 'section',
" for example.  I don't have to type /section for that:
set incsearch

"Highlight things that we find with search
set hlsearch!
" nnoremap <C-h><C-h> :set hlsearch!<CR>
nnoremap <silent> ,/ :set hlsearch!<CR>

"Turn syntax highlighting on.  (This helps you know when you leave a brace open!):
syntax on

" Vim window stuff
"I'm pretty sure this makes wrapped lines break at spaces, not in the middle of words:
set linebreak breakat=\ 
set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" :set formatoptions+=w
:set formatoptions+=t
" :set textwidth=79

"Soft wrap long lines
set wrap

" setlocal wrap nolist linebreak breakat=\ 

"Display filename in titlebar of window
set title

"I like to see line numbers:
set number

" Make selection more natural
set selection=exclusive

"Highlight the line that the cursor is on:
set cursorline

"paragraph formatting stuff:
"This tells Vim to use an external program, Par, to format my paragraphs. 
"This comes from www.vimcasts.org
set formatprg=par

"I don't recall where this came from, but it makes Vim put all its backup
"and temporary files in places I don't mind:
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

""""""""""""""""""""""""""""""
" GENERIC PLUGIN BEHAVIOR """"
""""""""""""""""""""""""""""""
"Allows for plugins to do smart indentation (I think!):
" filetype plugin indent on

"I think this lets you use filetype specific plugins:
" filetype plugin on

"To be frank, offhand I don't know exactly what these two do.
"The first does something with the Omni Complete function, which is very helpful.
"The second does something when you have a file open in Vim and then open it
"with another program and make changes. I think this makes Vim update its version
" of the file:
" set ofu=syntaxcomplete#Complete
" set autoread
" Tells Vim not to automatically reload changed files
set noautoread

""""""""""""""
" SPACING """"
""""""""""""""  
"If you are indented and start a new line, this makes the new line indented, too:
set autoindent

"This it makes some sort of autoindenting occur, like when you have an open { at the end of a line.  I'm not sure I love this, so it might not last long:  
set smartindent
set preserveindent

"These deal with what the TAB key inserts.
"I set my tabs to be only two spaces wide (default is 4).
"The second one makes sure the shift function knows this
""(you use that by selecting some text and hitting > for multiple lines and >>
"for a single line.  The last one converts TAB characters into spaces instead
"of TAB characters.  (Apparently this is big to programmers,
"I use it to follow conventions in the Ruby programming language.
set tabstop=4 shiftwidth=4 expandtab

"This turns off physical line wrapping (i.e. auto insertion of newlines)
"set textwidth=0 wrapmargin=0
" set textwidth=79

set scrolloff=5

"""""""""""""""
"""" FOLDS """"
"""""""""""""""
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set nofoldenable " Don't fold on start

"Specify a column-width for fold markers:
set foldcolumn=4

"I want to mark folds manually.  So in a .tex file I can write %{{{ to start a section and %}}} to close it.
"Then a zc in normal mode will shrink the whole section to one line.  Very tidy.
" set foldmethod=manual "alternatives: indent, syntax, marker (uses `{{{` to open and `}}}` to close)

"Unfold all folds when file is read in because pymode by default folds them.
" au BufRead * normal zR

"Think this is no visual bell
set novb

""""""""""""""""
" KEYMAP STUFF "
""""""""""""""""

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

"If you have wrapped lines, k will take you to the next line, which likely means the next paragraph.  gk will take you down what you think of as one line.  If you want that to be the default, then some of these mappings will do that.
" noremap <up> gk 
" noremap <down> gj
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
" noremap  <buffer> <silent> 0 g0
" noremap  <buffer> <silent> $ g$

" map Alt-j and Alt-k to scroll screen while maintaining cursor position at current line
noremap j <C-e>
noremap k <C-y>
inoremap j <Esc><C-e>i
inoremap k <Esc><C-y>i

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

"This lets you use your mouse
set mouse=a

"Operations for copy and paste will work with OS clipboard.
"No need to prefix with '+' or *
set clipboard=unnamedplus

" nnoremap <F2> :set invpaste paste?<CR>
" set pastetoggle=<F2>
" nnoremap <C-P> :set invpaste paste?<CR>
" set pastetoggle=<C-P>

" Clear paste mode when going back to normal mode
au InsertLeave * set nopaste

set showmode

noremap <backspace> O<Esc>j
" noremap <CR> o<Esc>k

"Show commands
set showcmd

"Map jj to Esc key
inoremap jj <Esc>

"Set incremental search
set incsearch
"Case insensitive search
set ic

"Map ';' to ':'
nnoremap ; :
"Map ',' to ';'
nnoremap ;; ;

set ignorecase
set smartcase

set ruler

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%==%c,%l/%L\ %P


nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" This is suppose to auto source vimrc file after editing and saving it.
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete over line breaks, or automatically-inserted indentation, or the place where insert mode started:
set backspace=indent,eol,start

" let g:jedi#popup_on_dot = 0
" let g:jedi#use_tabs_not_buffers = 0
" autocmd FileType python setlocal completeopt-=preview

let mapleader = ","
nnoremap <silent> <Leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>o :NERDTreeToggle<CR>

" Shortcut for comment t
map <Leader>c gcc

" Map open a copy of current window in split window
nnoremap <Leader>w <C-w>v

" Map shortcut key to open VIMRC file
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Toggle between absolute line number and relative number
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set number
"   else
"     set relativenumber
"   endif
" endfunc
" nnoremap <C-n> :call NumberToggle()<cr>

" Revert vim to absolute line number when focus is lost
" :au FocusLost * :set number
" :au FocusGained * :set relativenumber

" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Remapped keys for quick window splits navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" :source ~/.vim/bundle/vim-matchit/plugin/matchit.vim

" Make Y behave normally
" map Y y$

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" Spell checking
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"Enable powerline tabline
" let g:airline#extensions#tabline#enabled = 1
"Configure airline tab separator
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'
"Use nice fonts from powerline
let g:airline_powerline_fonts = 1


"Allows you to use w!! to save file that requires root priviledge
"and was opened without it.
cmap w!! w !sudo tee % >/dev/null

" Go to tab by number 
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
"Map Alt-l and Alt-h to move between tabs
noremap l gt
noremap h gT
inoremap l <Esc>gti
inoremap h <Esc>gTi

"Configure CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' 
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*.swp,*.bak,*.class,*.o,*.obj,*.pyc,*.pkl,.git,*.jpg,*.bmp,*.png,*.mat,*.bak,*.pdf

"Rainbow Parentheses
au FileType c,cpp,objc,objcpp,py,java,m call Load_Rainbow()

function! Config_Rainbow()
    call rainbow_parentheses#load(0)
    call rainbow_parentheses#load(1)
    call rainbow_parentheses#load(2)
endfunction

function! Load_Rainbow()
    call rainbow_parentheses#activate()
endfunction

augroup TastetheRainbow
    autocmd!
    autocmd Syntax * call Config_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile * call Load_Rainbow()
augroup END

let g:rbpt_colorpairs = [
    \ ['LightRed',       'RoyalBlue3'],
    \ [112,    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['red',     'SeaGreen3'],
    \ [226, 'DarkOrchid3'],
    \ ['red',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ [112,       'SeaGreen3'],
    \ [226, 'DarkOrchid3'],
    \ [112,    'firebrick3'],
    \ [204,    'SeaGreen3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ [112,     'DarkOrchid3'],
    \ ['gray',    'RoyalBlue3'],
    \ ]

" " Update this with the amount of supported colors
let g:rbpt_max = 16

nnoremap <silent> <Leader>R :RainbowParenthesesToggle<CR>

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" map yankring
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_history_dir = '~/Documents'

"Python mode
let g:pymode = 1
let g:pymode_lint_cwindow = 0

" let g:virtualenv_directory="~/.virtualenvs"
let g:pymode_virtualenv = 1
let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_completion = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

" Disable completion previews with function prototypes, etc.
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

nnoremap <silent> <Leader>l :TlistToggle<CR>
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_Show_One_File = 1

" Tasklist settings
"Remap tasklist shortcut
map <Leader>v <Plug>TaskList
let g:tlWindowPosition = 0

" Underline the current line with dashes in normal mode
nnoremap <F4> yyp<c-v>$r-
" Underline the current line with dashes in insert mode
inoremap <F4> <Esc>yyp<c-v>$r-A

highlight clear SpellBad
highlight SpellBad ctermfg=196 term=underline cterm=underline
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" highlight SpellLocal term=underline cterm=underline

" DelimitMate add extra newline after typing cr inside a pair of delimiters
let delimitMate_expand_cr = 1

" Highlight column
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Map save to C-s
" Might need to modify bash_profile
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" Make sure YouCompleteMe don't use Tab so it will not conflict with UltiSnips
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType = "context"

" UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" let g:ultisnips_python_style = 0x3
let g:UltiSnips = {}
let g:snips_email = "lightalchemist@gmail.com"
let g:snips_author = "Hong-Wei Ng"
let g:snips_github = "https://github.com/lightalchemist"

set virtualedit=onemore " Allow for cursor beyond last character
set showmatch " Set show matching parenthesis

