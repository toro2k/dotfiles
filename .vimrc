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

set foldmethod=indent
set foldlevelstart=1

set nobackup
set nowritebackup
set noswapfile

colorscheme toro2k

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing spaces on save
autocmd BufNewFile,BufRead *.spec set filetype=ruby

map j gj
map k gk
map 0 ^
map Y y$

map <leader>ba :edit #<cr>
map <leader>hh :set hlsearch! hlsearch?<cr>



" PLUGIN SPECIFIC STUFF
" maybe are better placed in after/plugin?

map <silent> <leader>tt :NERDTreeToggle<cr>

" Put a space between comment characters and the
" beginning of the commented line.
let NERDSpaceDelims=1

