" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'

Bundle 'Raimondi/delimitMate'
Bundle 'klen/python-mode'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/ShowMarks'

Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Gundo'
Bundle 'majutsushi/tagbar'

Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'honza/vim-snippets'
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tlib_vim'
Bundle 'vim-scripts/TagHighlight.git'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'

Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'

" Color schemes
Bundle 'lightalchemist/molokai'
Bundle 'junegunn/seoul256.vim'

filetype plugin indent on

"Must set this to enable 256 color support
set t_Co=256

let g:molokai_original=1
let g:rehash256 = 1
colorscheme molokai

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
" let g:seoul256_background = 236
" colorscheme seoul256

let g:goyo_width = 100

" Ensure colors work correctly in tmux
set term=screen-256color

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
set hidden

" Vim window stuff
"I'm pretty sure this makes wrapped lines break at spaces, not in the middle of words:
set linebreak breakat=\ 
set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

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

" Clear paste mode when going back to normal mode
au InsertLeave * set nopaste

set showmode

noremap <backspace> O<Esc>j
noremap <CR> o<Esc>k

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

"Configure CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' 
let g:ctrlp_working_path_mode = 'ra'

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

" Update this with the amount of supported colors
let g:rbpt_max = 16

nnoremap <silent> <Leader>R :RainbowParenthesesToggle<CR>

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" map yankring
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_history_dir = '~/Documents'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
" let g:pymode_lint_write = 1

" Support virtualenv
" let g:virtualenv_directory="~/.virtualenvs"
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" let g:pymode_folding = 1

let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion_bind = '<C-Space>'
" let g:pymode_rope_completion = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

let g:pymode_options_colorcolumn = 0

" Turn off warnings
let g:pymode_warnings = 1

" YouCompleteMe
" Disable completion previews with function prototypes, etc.
set completeopt-=preview
set previewheight=50  " Preview window height
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
" We must set this to the SAME python YCM was compiled with!
" This is Macports python 2.7
" let g:ycm_path_to_python_interpreter = '/opt/local/bin/python2.7'
let g:ycm_path_to_python_interpreter = '/home/hongwei/virtualenvs/ml/bin/python'

set pumheight=10  " Limit show max 10 suggestions

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
" let g:syntastic_cpp_compiler_options = " -std=c++11"
let g:syntastic_quiet_messages = {"type": "style"}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_java_checkers = []
let g:syntastic_error_symbol = "x"
let g:syntastic_style_error_symbol = "x"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = "!"
let g:syntastic_always_populate_loc_list = 1

" let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_checker_args='--ignore=E501,E225,E231,E302,F401 --max-complexity 10'

" UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ultisnips_python_style = 0x3
let g:UltiSnips = {}
let g:snips_email = "lightalchemist@gmail.com"
let g:snips_author = "Hong-Wei Ng"
let g:snips_github = "https://github.com/lightalchemist"

set virtualedit=onemore " Allow for cursor beyond last character
set showmatch " Set show matching parenthesis

" DelimitMate add extra newline after typing cr inside a pair of delimiters
let delimitMate_expand_cr = 1

" Tagbar
map <silent><Leader>v :TagbarToggle<CR>

" Underline the current line with dashes in normal mode
" nnoremap <c-_> yyp<c-v>$r-
" Underline the current line with dashes in insert mode
" inoremap <c-_> <Esc>yyp<c-v>$r-A

" Spell checking
" highlight clear SpellBad
" highlight SpellBad ctermfg=196 term=underline cterm=underline
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" highlight SpellLocal term=underline cterm=underline

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

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" So that italics will show up proerly in VIM
set t_ZH=[3m
set t_ZR=[23m
