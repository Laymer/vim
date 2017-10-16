execute pathogen#infect()

filetype on
syntax on
colorscheme badwolf

set colorcolumn=90
set number

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

nnoremap <Leader><Leader> :e#<CR>

set showmatch

" Plugin Adjustments
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:gitgutter_sign_column_always=1

