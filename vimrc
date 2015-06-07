set nocompatible
filetype off " required for Vundle

syntax on
let mapleader=","
set nowrap

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" Syntax Highlighting
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chase/vim-ansible-yaml'
Plugin 'honza/dockerfile.vim'
Plugin 'jinfield/vim-nginx'

call vundle#end()
filetype plugin indent on
" End Vundle

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
