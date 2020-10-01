" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sleuth'
Plug 'megantiu/true.vim'

" Initialize plugin system
call plug#end()

" tabs
set tabstop=2
set shiftwidth=2
set smarttab

" wrap
set wrap

" autoindent
set ai
set cin

" searching
set showmatch
set hlsearch
set incsearch
set ignorecase

" lazy scripts
set lz

" visible tabs
set listchars=tab:··
set list

" encoding and format
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" mouse
set mouse=a

" syntax highlighting
syntax on

if (has('termguicolors'))
	set termguicolors
endif

colorscheme true

" line numbers
set number

" return to last position after reopening a file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

