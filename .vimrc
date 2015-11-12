set nocompatible

" For powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim

" Basic settings
filetype off
execute pathogen#infect()
filetype plugin indent on
syntax on
set encoding=utf-8

" Set leader key
let mapleader = ","

set number " Display line numbers
" set cursorline " Have a line indicating the cursor location
set backspace=indent,eol,start

""" Colourschemes
set background=dark
colorscheme gruvbox


""" Searching and patterns
set ignorecase " Default to using case insensitive searches
set smartcase " Unless uppercase letters are used int he regex
set showmatch " Briefly jump to a paren once it has been balanced
set incsearch " Incrementally search while typing a regex
set hlsearch " Highlight searches by default
set gdefault " Remove the need for /g at the end of substitutions

nnoremap <leader><space> :noh<cr>

nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

" Modelines has security exploits, so disable it
set modelines=0

""" Tab settings
set expandtab " Use spaces not tabs
set tabstop=4 " <Tab> inserts 4 spaces
set softtabstop=4
set shiftwidth=4 " An indent level is 4 spaces wide
set shiftround " Rounds indent to a multiple of shiftwidt

""" Indentation
set autoindent " Always set autoindenting
set smartindent " Use smart indent if there is no indent file
"vnoremap < <gv " better indentation
"vnoremap > >gv " better indentation

""" Command mode completion
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=list:longest " Make tab completion similarr to bash

set wildignore+=.git " version control dir
set wildignore+=*.o,*.obj,*.exe,*.dll " binary files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " vim swap files
set wildignore+=*.pyc " compiled Python files

""" Navigation
nnoremap j gj
nnoremap k gk

inoremap jk <ESC>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

nnoremap <C-]> :bnext<CR>
nnoremap <C-[> :bprevious<CR>

""" Backups
set noswapfile
set backup
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

""" Create the folders above if they do not exist
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), "p")
endif

" Recommended settings for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=4

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=0

""" Spelling
set spell spelllang=en_gb
nnoremap <F4> :set spell!<CR>

" Always show statusline
set laststatus=2
" Use 256 colours when available
set t_Co=256

""" Line settings
set nowrap
set textwidth=79
set colorcolumn=80

""" Reading and writing
set noautoread " Don't automatically re-read changed files
set autowrite " Stop complaining about unsaved buffers
" set autowriteall

""" Insert timestamp
:nnoremap <F2> "=strftime("%c")<CR>P
:inoremap <F2> <C-R>=strftime("%c")<CR>

:nnoremap <F3> "=strftime("%H:%M")<CR>P
:inoremap <F3> <C-R>=strftime("%H:%M")<CR>

""" Functions

function! <SID>StripTrailingWhitespace()
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction

"function! NumberToggle()
	"if(&relativenumber == 1)
		"set number
	"else
		"set relativenumber
	"endif
"endfunction

"nnoremap <leader>l :call NumberToggle()<CR>

nmap <leader>E :Errors<CR>
nmap <leader>lc :lclose<CR>
nnoremap <leader>u :GundoToggle<CR>
nmap <silent> <leader>w :call <SID>StripTrailingWhitespace()<CR>

""" Quick edit
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>f 1z=
