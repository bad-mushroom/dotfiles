" Global Settings
set nocompatible  			" Remove vi compatibility
filetype off
syntax on

set linespace=5				" Veritcle line padding
set showmode                " Show current mode
set nowrap                  " Prevent line wrapping
set tabstop=4               " a tab is four spaces
set relativenumber 			" Line numbers relative to current line
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set formatoptions+=or
set cursorline
set linespace=8

" Vundle Settings
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" MacVim Gui Settings
set guioptions-=T   		" Removes top toolbar
set guioptions-=r   		" Removes right scrollb bar
set go-=L           		" Removes left hand scroll bar
set mouse=a
set guifont=Monaco:h13

" Bundles

" Plugin Manager
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/closetag.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Townk/vim-autoclose'
Bundle 'majutsushi/tagbar'
Bundle 'Yggdroot/indentLine'

" Nerd Tree
" autocmd vimenter * NERDTree		" Launch automatically
map <C-n> :NERDTreeToggle<CR>	" Toggle w/ [CTRL]+n
let NERDTreeIgnore = [ '.DS_Store', '.*.swp$', '\~$' ]

" Code Completion
let g:neocomplcache_enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Airline
set laststatus=2

" Colors
set t_Co=256  					" Set terminal to display 256 colors.
set background=dark
colorscheme chris

" Ignore Files
set wildignore+=*.swp,.git/,*.jpg,*.jpeg,*.png,*.gif,*.psd,*.pdf,*.DS_Store

" File Types
au BufNewFile,BufRead *.mh set filetype=php