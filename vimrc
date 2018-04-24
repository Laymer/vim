""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @jsonkenl Vimrc Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start Pathogen
execute pathogen#infect()

" Style setup
set nowrap
set encoding=utf8
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

" Break long lines by word, not char/<C-y>
set linebreak

" Make j & k linewise
map j gj
map k gk

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

" Remap arrow keys to resize splits
let g:elite_mode=1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif 

" Omni Completion
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

"  kien/ctrlp.vim
"  Raimondi/delimitMate
"  easymotion/vim-easymotion
"  airblade/vim-gitgutter
"  Yggdroot/indentLine
"  itchyny/lightline.vim
"  scrooloose/nerdcommenter
"  scrooloose/nerdtree
"  Xuyanp/nerdtree-git-plugin
"  ervandew/supertab
"  OrangeT/vim-csharp
"  elixir-editors/vim-elixir
"  pangloss/vim-javascript
"  Shougo/neocomplete.vim
"  w0rp/ale
"  OmniSharp/omnisharp-vim

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

" ALE
" ----------------------------------------------
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Lightline
" ----------------------------------------------
set laststatus=2
set noshowmode

" Add Ale support
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? ' ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

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
" must install vim-nox on linux for this to work (sudo apt-get install vim-nox)
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

" vim-javascript
" ---------------------------------------------
let g:javascript_plugin_flow = 1

" omnisharp-vim
" --------------------------------------------
let g:OmniSharp_server_use_mono = 1
