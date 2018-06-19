"dein Scripts-----------------------------

set runtimepath+=/Users/arthurkoziel/.vim/bundles/repos/github.com/Shougo/dein.vim
if dein#load_state('/Users/arthurkoziel/.vim/bundles')
  call dein#begin('/Users/arthurkoziel/.vim/bundles')
  call dein#add('/Users/arthurkoziel/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('w0rp/ale')
  call dein#add('tpope/vim-commentary')
  call dein#add('mhartington/oceanic-next')
  call dein#add('ntpeters/vim-better-whitespace') " highlight trailing whitespace
  call dein#add('sheerun/vim-polyglot') " language pack with syntax highlight and indentations
  call dein#add('scrooloose/nerdtree')
  call dein#add('dracula/vim')

  call dein#end()
  call dein#save_state()
endif

"End dein Scripts-------------------------

filetype plugin on

set modeline
set nobackup
set nowritebackup
set noswapfile
set noshowmode
set noshowcmd
set number
set clipboard+=unnamedplus
set undofile
set undodir=$HOME/.vim/undo
set gdefault
set mouse=a

" spaces instead of tabs
set expandtab
set shiftwidth=4
set softtabstop=4

" custom indent
autocmd FileType make setlocal noet
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab

let mapleader = "\<Space>"

" colors
syntax enable
set t_Co=256
set background=dark
colorscheme OceanicNext

" clear search highlighting on \ key (backslash)
nnoremap \ :noh<return>

" Ale
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_options = "--ignore=E3"

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Always show a gutter, not just when Ale reports errors
sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Live substitution
set inccommand=split

map <Leader>b Oimport ipdb; ipdb.set_trace()

" Format json documents
com! FormatJSON %!jq '.'

" Open new split panes to right and bottom
set splitbelow
set splitright

" Easier movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF
set rtp+=/usr/local/opt/fzf

" NERDTree Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" close vim if only window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

command WQ wq
command Wq wq
command W w
command Q q
