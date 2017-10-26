""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @jsonkenl Vimrc Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start Pathogen
execute pathogen#infect()

" Style setup
set nowrap
syntax on
filetype plugin indent on
colorscheme badwolf 

" Custom leader  
let mapleader=" "

" Ignore specific file types
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Line numbering
set ruler
set number

" Crosshairs
hi CursorLine cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
:set cursorline! cursorcolumn!

" Keep more in memory to speed things up
set hidden
set history=100

" Tab setup 
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
nnoremap <silent> <leader>h :nohlsearch<Bar>:echo<CR>

" Re-open Previously Opened File
nnoremap <Leader>b :e#<CR>

" CSS Auto Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" PLUG-IN LIST 
"""""""""""""""""""""""""""""""""""""""""""""""""

"  ctrlp.vim
"  delimitMate
"  easymotion
"  gitgutter
"  indentLine
"  lightline
"  nerdcommenter
"  nerdtree
"  nerdtree-git-plugin
"  supertab
"  vim-csharp
"  vim-elixir
"  vim-javascript
"  vim-multiple-cursors
"  Shougo/neocomplete.vim

" PLUG-IN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
" ----------------------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFocus<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" GitGutter
" ----------------------------------------------
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always=1
endif

" Ctrlp
" ----------------------------------------------
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_show_hidden=1

" Lightline
" ----------------------------------------------
set laststatus=2
set noshowmode

" Easymotion
" ----------------------------------------------
" <leader>f{char} to move to {char}
map <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <leader><leader>L <Plug>(easymotion-bd-jk)
nmap <leader><leader>L <Plug>(easymotion-overwin-line)

" Move to word
map <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

" neocomplete
" ----------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns={}
endif
let g:neocomplete#keyword_patterns['default']='\h\w*'

" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "/<C-y>" : "") . "\<CR>"
endfunction

" <TAB> completion
inoremap <expr><TAB> pumvisbile() ? "\<C-n>" : "\<TAB>"

