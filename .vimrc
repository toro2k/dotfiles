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

colorscheme slate
hi Normal guibg=#2e3436
hi NonText guibg=#2e3436


function! Foo(arg)
    if type(a:arg) == type('')
        echo "It's a string"
    else
        echo "Not a string"
    endif
endfunction
