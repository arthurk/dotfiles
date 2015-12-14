set nocompatible
filetype off " required for Vundle

syntax on
let mapleader = "\<Space>"
set nowrap

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-surround'
Plugin 'stephpy/vim-yaml'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'

" Syntax Highlighting
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'honza/dockerfile.vim'
Plugin 'jinfield/vim-nginx'

call vundle#end()
filetype plugin indent on
" End Vundle

" Save with <space>w
nnoremap <Leader>w :w<CR>


set background=dark
colorscheme solarized
let g:airline_theme='solarized'

" autocompletion for status line
set wildmenu
set wildmode=longest,list,full

set modeline
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set backspace=2
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set expandtab
set background=dark
set laststatus=2 " always a status line
set noshowmode
set backspace=2
set number

set undofile
set undodir=$HOME/.vim/undo

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" map semicolon to colon
nmap ; :

" syntastic
let g:syntastic_python_checkers=['flake8']

" syntax highlighting
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile Dockerfile set filetype=dockerfile
au BufRead,BufNewFile *.service set filetype=systemd
au BufRead,BufNewFile *.cnf set syntax=dosini
au BufRead,BufNewFile *.yaml,*.yml set filetype=yaml

" Always show a gutter
sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Ag for CtrlP
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" PyMatcher for CtrlP
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" insert pdb trace
map <Leader>i :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction

set indentkeys-=<:>

" Go
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
