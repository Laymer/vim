" Startup
execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme badwolf 

" Custom leader  
let mapleader=" "

" Ignore Specific File Types
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Line numbering
set ruler
set number

" Keep more in memory to speed things up
set hidden
set history=100

" Indenting Logic
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Highlight matching parenthesis
set showmatch

" Better Search
set hlsearch
set is
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Re-open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" CSS Auto Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCss

""""""""""""""""
" PLUG-INS 
""""""""""""""""

" NERDTree
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFocus<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHijackNetrw=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" GitGutter
let g:gitgutter_sign_column_always=1

" Ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_show_hidden=1

" Lightline
set laststatus=2
set noshowmode

