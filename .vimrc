execute pathogen#infect()

syntax on
filetype plugin indent on

set expandtab
set shiftwidth=4
set softtabstop=4

set laststatus=2

set incsearch
set ignorecase
set smartcase
set hlsearch

colorscheme toro2k

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Put a space between comment characters and the
" beginning of the commented line.
let NERDSpaceDelims=1
