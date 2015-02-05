noremap <silent> <leader>ee :Errors<cr>

" C++
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = "-Wall -std=c++11"

" C
let g:syntastic_c_compiler = "clang"
let g:syntastic_c_compiler_options = "-Wall"
