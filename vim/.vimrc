" Vundle
set nocompatible
filetype off

" Let Vundle manage Vundle required!
set rtp+=~/.config/nvim/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'python-mode/python-mode'
Plugin 'vim-scripts/matchit.zip'

Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
Plugin 'zchee/deoplete-clang'

Plugin 'Shougo/echodoc.vim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'scrooloose/nerdtree'
Plugin 'sjl/Gundo.vim'
Plugin 'majutsushi/tagbar'

Plugin 'google/vim-searchindex'

" Plugin 'vim-syntastic/syntastic'
Plugin 'neomake/neomake'

Plugin 'tomtom/tcomment_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'

" Plugin "git://github.com/MarcWeber/vim-addon-mw-utils.git"
" Plugin "git://github.com/tomtom/tlib_vim.git"
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/TagHighlight.git'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'reedes/vim-wheel'

Plugin 'junegunn/vim-easy-align.git'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Color schemes
Bundle 'lightalchemist/molokai'
Plugin 'junegunn/seoul256.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'AlessandroYorba/Sierra'

" Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'

Plugin 'Chiel92/vim-autoformat'

call vundle#end()

filetype plugin indent on

"Must set this to enable 256 color support
set t_Co=256

" let g:molokai_original=1
" let g:rehash256 = 1
" colorscheme molokai

" seoul256 (dark):
  " Range:   233 (darkest) ~ 239 (lightest)
  " Default: 237
let g:seoul256_background = 235
colorscheme seoul256

" colorscheme solarized

" let g:sierra_Twilight = 1
" let g:sierra_Sunset = 1
" colorscheme sierra

let g:goyo_width = 100
let g:goyo_height = 100

" Ensure colors work correctly in tmux
" set term=screen-256color

""""""""""""""""""""""""""""""""""""""""""
"" SEARCH, HIGHLIGHT, SPELLING, ETC.
""""""""""""""""""""""""""""""""""""""""""
" The following lets searches be incremental.
" So in normal mode, /sec will go to the first 'section',
" for example.  I don't have to type /section for that:
set incsearch

"Highlight things that we find with search
set hlsearch
nnoremap <silent> ,/ :set hlsearch!<CR>

"Turn syntax highlighting on.  (This helps you know when you leave a brace open!):
syntax on

" Hides buffer instead of closing them. Better buffer handling.
" See http://nvie.com/posts/how-i-boosted-my-vim/
" set hidden

" Vim window stuff
"I'm pretty sure this makes wrapped lines break at spaces, not in the middle of words:
set linebreak breakat=\ 
set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Remove extra dots after fold
set fillchars=fold:\ 

" :set formatoptions+=w
:set formatoptions+=t

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

" Use F2 to call autoformat plugin
noremap <F2> :Autoformat<CR>
" Disable the fallback to vim's indent file, retabbing and removing trailing whitespace
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" Path to formatter
let g:formatterpath = ['/usr/lib/llvm-6.0/bin']


"I don't recall where this came from, but it makes Vim put all its backup
"and temporary files in places I don't mind:
set backupdir=~/.vim/tmp/backup//,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/tmp/swap//,~/.tmp,~/tmp,~/var/tmp,/tmp

" persist Gundo tree between sessions
set undodir=~/.vim/tmp/undo//
set undofile
set history=100
set undolevels=100

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
" set autoindent

"This it makes some sort of autoindenting occur, like when you have an open { at the end of a line.  I'm not sure I love this, so it might not last long:  
" set smartindent
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
nnoremap <silent> <Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>
vnoremap <Space> zA

set foldmethod=indent
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

" TODO: Remap wheel to Alt-k, Alt-j, and Alt-shift-k, Alt-shift-j for this
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

" Clear paste mode when going back to normal mode
au InsertLeave * set nopaste

" set showmode
" set noshowmode

noremap <backspace> O<Esc>j
" noremap <CR> o<Esc>k

"Show commands
set showcmd

" set cmdheight=2

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

" Press F3 to retab
" nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" This is suppose to auto source vimrc file after editing and saving it.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END " }
"Backspace works in Insert mode (e.g. not inserting a ^?), but won't delete over line breaks, or automatically-inserted indentation, or the place where insert mode started:
set backspace=indent,eol,start

let mapleader = ","
nnoremap <silent> <Leader>u :GundoToggle<CR>
nnoremap <silent> <Leader>o :NERDTreeToggle<CR>

" Shortcut for comment t
map <silent> <Leader>c :TComment<CR>
" map <silent> <Leader>cp <c-_>p
" map <silent> <Leader>cr <c-_>r

" Map open a copy of current window in split window
nnoremap <Leader>w <C-w>v<C-w>h

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

set splitbelow " Place new horizontal split below
set splitright " Place new vertical split on right

" Make Y behave normally
" nnoremap Y y$

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

set encoding=utf-8

"Enable powerline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
"Configure airline tab separator
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '|'
"Use nice fonts from powerline
let g:airline_powerline_fonts = 1
let g:airline_theme = "sol"
" let g:airline_theme = "molokai"
" let g:airline_theme = "tomorrow"
" let g:airline_theme = "light"
" let g:airline_theme = "solarized"
" let g:airline_theme = "raven"
" let g:airline_theme = "powerlineish"
" Might pair well with seoul256 colorscheme
" let g:airline_theme = "hybridline"
" let g:airline_theme = "bubblegum"


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

" Cycle through buffer
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left> :bprevious<CR>

"Configure Ag.vim
" Search from project root rather than cwd
let g:ag_working_path_mode="r"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
nnoremap <Leader>af :Ack!  %<Left><Left>
nnoremap <Leader>f :Ack!  <space><Left><Left>

"Configure CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|jpg|jpeg|png|bmp)$|build|bin' 
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"Use silver-searcher to search
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set wildignore+=*.swp,*.bak,*.class,*.o,*.obj,*.pyc,*.pkl,*.jpg,*.bmp,*.png,*.mat,*.bak,*.pdf

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
    \ ['LightRed'  , 'RoyalBlue3']  ,
    \ [112         , 'SeaGreen3']   ,
    \ ['darkgray'  , 'DarkOrchid3'] ,
    \ ['darkgreen' , 'firebrick3']  ,
    \ ['darkcyan'  , 'RoyalBlue3']  ,
    \ ['red'       , 'SeaGreen3']   ,
    \ [226         , 'DarkOrchid3'] ,
    \ ['red'       , 'firebrick3']  ,
    \ ['gray'      , 'RoyalBlue3']  ,
    \ [112         , 'SeaGreen3']   ,
    \ [226         , 'DarkOrchid3'] ,
    \ [112         , 'firebrick3']  ,
    \ [204         , 'SeaGreen3']   ,
    \ ['darkgreen' , 'RoyalBlue3']  ,
    \ [112         , 'DarkOrchid3'] ,
    \ ['gray'      , 'RoyalBlue3']  ,
    \ ]

" Update this with the amount of supported colors
let g:rbpt_max = 16

nnoremap <silent> <Leader>R :RainbowParenthesesToggle<CR>

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" map yankring
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_history_dir = '~/Documents'

let g:pymode_python = 'python3'

let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0

let g:pymode_rope_goto_definition_bind = '<leader>g'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_rename_bind = '<leader>pr'

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pep8']
" let g:pymode_lint_checkers = ['pyflakes']
" let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
" let g:pymode_lint_write = 1
"
" " Support virtualenv
" " let g:virtualenv_directory="~/.virtualenvs"
" " let g:pymode_virtualenv = 1
" "
" " " Enable breakpoints plugin
" " let g:pymode_breakpoint = 1
" " let g:pymode_breakpoint_bind = '<leader>b'
" "
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all

" let g:pymode_python = '/home/hongwei/anaconda3/bin/python3'

" let g:pymode_folding = 0

let g:pymode_lint_cwindow = 0
" let g:pymode_rope_complete_on_dot = 0
" " let g:pymode_rope_completion_bind = '<C-Space>'
" " let g:pymode_rope_completion = 1
" let g:pymode_rope_completion = 0
" let g:pymode_rope_lookup_project = 0
"
" let g:pymode_options_colorcolumn = 0
"
" " Turn off warnings
" let g:pymode_warnings = 1

" deoplete
set runtimepath+=~/.vim/bundle/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.python = ''

set runtimepath+=~/.vim/bundle/deoplete-clang/
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/6.0/include/'
let g:deoplete#sources#clang#std#cpp = 'c++1z'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#flags = [
    \ "-stdlib=libc++",
    \ ]


let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:deoplete#sources#jedi#extra_path = '~/.local/lib/python3.6/site-packages'

set shortmess+=c
set cmdheight=2
set showmode

let g:echodoc#enable_at_startup = 1

" let g:deoplete#sources#jedi#show_docstring = 0

" Disable completion previews with function prototypes, etc.
set completeopt-=preview
" set previewheight=50  " Preview window height

set pumheight=10  " Limit show max 10 suggestions

" Neomake
" autocmd! BufWritePost * Neomake!
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202,E501',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }

let g:neomake_python_pep8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202,E501',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }

let g:neomake_python_enabled_makers = ['flake8', 'pep8']


" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Neosnipps
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <tab>     <Plug>(neosnippet_expand_or_jump)
" smap <tab>     <Plug>(neosnippet_expand_or_jump)
" xmap <tab>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" " Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" " Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ultisnips_python_style = 0x3
let g:UltiSnips = {}
let g:snips_email = "hngwei.ng@gmail.com"
let g:snips_author = "Hong-Wei Ng"
let g:snips_github = "https://github.com/lightalchemist"


set virtualedit=onemore " Allow for cursor beyond last character
" set showmatch " Set show matching parenthesis

" DelimitMate add extra newline after typing cr inside a pair of delimiters
let delimitMate_expand_cr = 1

" Tagbar
map <silent><Leader>v :TagbarToggle<CR>

" Underline the current line with dashes in normal mode
nnoremap <c-_> yyp<c-v>$r-
" Underline the current line with dashes in insert mode
inoremap <c-_> <Esc>yyp<c-v>$r-A

" Goyo
function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif

  " Allow to quit in Goyo mode using ':q'
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif

  " This might help fix problem of airline top bar not drawn properly.
  " autocmd AirlineRefresh

  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
          qa!
      else
          qa
      endif
  endif
endfunction

autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()

" Save file and make project
set makeprg=make\ -C\ ../build\ -j4
nnoremap <F5> :w<cr>:make!<cr>

" F3 to toggle Goyo
nnoremap <silent> <F3> :Goyo<CR>
inoremap <silent> <F3> <Esc>:Goyo<CR>i

" Shift F3 to toggle Limelight
nnoremap <silent> O1;2R :Limelight!!<CR>
inoremap <silent> O1;2R <Esc>:Limelight!!<CR>i
let g:Limelight_default_coefficient = 0.7

" Shortcut to close preview window
nnoremap <silent> <Leader>pc :pc<CR>

" Requires Exuberant Tags
" Call: "ctags -R" at the root directory of project
" Search for tags all the way up the tree until one is found
set tags+=./tags;$HOME

" nnoremap <silent><c-q> :q<CR>
" nnoremap <silent><c-x> :x<CR>

" This will only work if VIM/terminal can handle italics
" highlight Comment cterm=italic

" By default don't show marks
let g:showmarks_enable=0
highlight ShowMarksHLl ctermfg=lightblue
highlight ShowMarksHLu ctermfg=lightblue
highlight ShowMarksHLo ctermfg=lightblue
let g:showmarks_textlower="-"
let g:showmarks_textupper="-"
let g:showmarks_textother="-"

" Set diff colors to more appropriate ones
highlight DiffAdd    cterm=bold ctermfg=7 ctermbg=1 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=7 ctermbg=1 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=7 ctermbg=1 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=7 ctermbg=1 gui=none guifg=bg guibg=Red

" So that italics will show up proerly in VIM
set t_ZH=[3m
set t_ZR=[23m

" For indenting function arguments over multiple lines
" http://stackoverflow.com/questions/11984520/vim-indent-align-function-arguments
set cino+=(0

" Mappings for EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nmap <silent> <Leader>a<Space> gaip<Space>
vmap <silent> <Leader>a<Space> gaip<Space>

" Shortcuts for aligning using Tabular
function! ConfigTabular()
    if exists(':Tabularize')
        nnoremap <silent> <Leader>a= :Tabularize /=<CR>
        vnoremap <silent> <Leader>a= :Tabularize /=<CR>
        nnoremap <silent> <Leader>a: :Tabularize /:<CR>
        vnoremap <silent> <Leader>a: :Tabularize /:<CR>
        " nnoremap <silent> <Leader>av :Tabularize /\w\s\zs<CR>
        " vnoremap <silent> <Leader>av :Tabularize /\w\s\zs<CR>
    endif
endfunction

autocmd VimEnter * call ConfigTabular()

"From Tim Pope's gist for 'cucumber table'
" Automatically align on '|' when creating a table
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
