filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set nocompatible
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

syntax on 		" syntax highlighting
"filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

:let mapleader = ","
:nmap ; :

let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

map <leader>td <Plug>TaskList
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>

colorscheme desert

" Omni Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" Python tab settings
set ai 
set ts=4 
set sts=4 
set et 
set sw=4 
set nu

" Settings for VimClojure
let vimclojure#ParenRainbow=1   " Rainbow parentheses'!
let vimclojure#HighlightBuiltins=1  " Highlight Clojure's builtins
" this should only be necessary if you don't have the ng client in your PATH
" let vimclojure#NailgunClient="/home/david/bin/ng"
let vimclojure#WantNailgun=1
let clj_want_gorilla=1
