set nocompatible
filetype off " required for Vundle

syntax on
let mapleader=","
set nowrap

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
" Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'

" Syntax Highlighting
Plugin 'altercation/vim-colors-solarized'
Plugin 'jinfield/vim-nginx'
Plugin 'honza/dockerfile.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'

call vundle#end()
filetype plugin indent on
" End Vundle

set background=dark
colorscheme solarized
let g:airline_theme='solarized'

" autocompletion for status line
set wildmenu
set wildmode=longest,list,full

" Omni completion
set omnifunc=syntaxcomplete#Complete

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

" python-mode
let g:pymode_rope = 1
let g:pymode_rope_completion = 0

let g:pymode_folding = 0

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()"
let g:pymode_breakpoint_key = '<leader>b'

let g:pymode_lint = 0

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
" nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf if &ft == '' | setfiletype nginx | endif
" docker
au BufNewFile,BufRead Dockerfile set filetype=dockerfile

" Always show a gutter
sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" highlighting for supervisord.conf
autocmd BufRead,BufNewFile supervisord.conf setf dosini

