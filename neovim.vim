"dein Scripts-----------------------------

set runtimepath^=~/.neovim/dein//repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.neovim/dein/'))

call dein#add('Shougo/dein.vim')
call dein#add('morhetz/gruvbox')
call dein#add('ConradIrwin/vim-bracketed-paste')
call dein#add('w0rp/ale')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('takac/vim-hardtime')
call dein#add('Shougo/deoplete.nvim')
call dein#add('nginx/nginx', {'rtp': 'contrib/vim'})
call dein#add('docker/docker', {'rtp': 'contrib/syntax/vim'})
call dein#add('chase/vim-ansible-yaml') 
call dein#add('tpope/vim-commentary') 
call dein#add('junegunn/fzf') 

call dein#end()

"End dein Scripts-------------------------

set background=dark
set modeline
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set backspace=2
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode
set backspace=2
set number
set commentstring=#\ %s
set clipboard+=unnamedplus

set undofile
set undodir=$HOME/.neovim/undo

" status line
set statusline=
set statusline+=%F
set statusline+=%=\ \[%{ALEGetStatusLine()}]\ \%*

let mapleader = "\<Space>"

colorscheme gruvbox

" Rainbow parantheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" hardtime
let g:hardtime_default_on = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" use ansible-yaml for all yaml files
au BufRead,BufNewFile *.yaml,*.yml set filetype=ansible

" clear search highlighting on \ key (backslash)
nnoremap \ :noh<return>

" Ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Always show a gutter
sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Disable expandtab for Makefile
:autocmd FileType make set noet

set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>

" Live substitution
set inccommand=split
