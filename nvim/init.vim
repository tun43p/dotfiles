call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-commentary'
Plug 'szw/vim-maximizer'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
call plug#end()

if &compatible
  set nocompatible
endif

filetype plugin indent on

set encoding=utf8
set langmenu=en_US
let $LANG='en_US'

set fileformat=unix
set hidden
set mouse=a
set scrolloff=5
set clipboard=unnamedplus
set foldmethod=marker
set backspace=2
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set cmdheight=1
set updatetime=300
set smartcase
set ignorecase
set hlsearch
set incsearch
set shortmess+=c
set noshowmode
set noshowcmd
set nowrap
set nolazyredraw
set noswapfile
set nowritebackup
set splitbelow splitright
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ruler
set number relativenumber
set diffopt+=vertical

if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

syntax on
set background=dark
set termguicolors
set t_Co=256
colorscheme codedark 
hi Normal guibg=NONE ctermbg=NONE
let mapleader=' '
let g:netrw_banner=0

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

nmap <leader>qq :bd<cr>

map <leader>b :split<cr>
map <leader>v :vsplit<cr>

nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

nnoremap <c-left> <c-w><c-h>
nnoremap <c-down> <c-w><c-j>
nnoremap <c-up> <c-w><c-k>
nnoremap <c-right> <c-w><c-l>

noremap x "_x
noremap X "_x

let g:lightline = {
 	\ 'active': {
 	\		'left': [ [ 'mode', 'paste' ],
 	\							[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\	},
	\	'component_function': {
	\		'gitbranch': 'gitbranch#name'
	\	},
	\		'colorscheme': 'codedark',
	\	}

lua require 'colorizer'.setup()

nnoremap <leader>m :MaximizerToggle!<cr>
