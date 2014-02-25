execute pathogen#infect()

syntax on
filetype plugin indent on

set autoread
set scrolloff=3
set laststatus=2

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase
set hlsearch

set tildeop

set nobackup
set nowritebackup
set noswapfile

colorscheme toro2k

" Remove trailing spaces on save from ANY file
autocmd BufWritePre * :%s/\s\+$//e

map j gj
map k gk

map 0 ^
map Y y$

if &diff
    map dq :qall<cr>
    syntax off
endif

map <leader>ba :edit #<cr>
map <leader>bd :bdelete<cr>
map <leader>hh :set hlsearch! hlsearch?<cr>
