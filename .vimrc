execute pathogen#infect()

if filereadable(expand("~/.vim/typos.vim"))
    source ~/.vim/typos.vim
endif

syntax on
filetype plugin indent on

set autoread
set scrolloff=3
set laststatus=2

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set incsearch
set ignorecase
set smartcase
set hlsearch

set nobackup
set nowritebackup
set noswapfile

set wildmode=list:longest,full

set clipboard=unnamedplus,exclude:cons\|linux

set colorcolumn=80

colorscheme toro2k

noremap j gj
noremap k gk

noremap H ^
noremap L $

noremap Y y$

" Uppercase the word under cursor in insert mode
inoremap <c-u> <esc>viwUea

noremap Q <nop>
noremap q: <nop>

if &diff
    noremap dq :qall<cr>
    syntax off
endif

noremap <silent> <leader>ba :edit #<cr>
noremap <silent> <leader>bd :bdelete<cr>
noremap <leader>hh :set hlsearch! hlsearch?<cr>

noremap <leader>ev :split + $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

augroup misc
    autocmd!
    " Remove trailing spaces on save from ANY file
    autocmd BufWritePre * %s/\s\+$//e
    " Turn on sql ftplugin when edit files from MySQL client
    autocmd BufRead /tmp/sql* setfiletype sql
augroup END
