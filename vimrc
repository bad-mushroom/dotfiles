" -------------------------
" Basic Config
" -------------------------

set nocompatible
filetype plugin indent on
syntax on

set number
set relativenumber
set cursorline

set showmode
set nowrap
set linespace=4

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

set background=dark

" Ignore files in autocomplete
set wildignore+=*.swp,.git/,*.jpg,*.jpeg,*.png,*.gif,*.psd,*.pdf,*.DS_Store

" -------------------------
" Plugin Manager (vim-plug)
" -------------------------

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'

call plug#end()

" -------------------------
" Plugin Config
" -------------------------

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.DS_Store$', '.*\.swp$', '\~$']

" Airline
set laststatus=2

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" -------------------------
" Completion (simple built-in)
" -------------------------
" NOTE: modern completion tools available if needed later

autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP

" -------------------------
" Filetypes
" -------------------------
au BufNewFile,BufRead *.mh set filetype=php

" -------------------------
" Misc
" -------------------------
set mouse=a
