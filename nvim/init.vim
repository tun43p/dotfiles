" Activate the vim-plug plugin manager
call plug#begin()
" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment stuff out
Plug 'tpope/vim-commentary'

" A Vim plugin which shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'
call plug#end()

" Disable compatibility mode
if &compatible
  set nocompatible
endif

" Enable automatic detection of file type, associated plugins and automatic indentation
filetype plugin indent on

" Defines the encoding of files in UTF-8
set encoding=utf8

" Set the language menu to French
set langmenu=fr_FR
let $LANG='fr_FR'

"  Defines the default file format in Unix format (LF only)
set fileformat=unix

" Hide buffers instead of closing them when switching to another buffer
set hidden

" Enable mouse support in Vim
set mouse=a

" Defines a scroll margin of 5 lines
set scrolloff=5

" Active the system clipboard to copy/paste with the universal clipboard
" set clipboard=unnamedplus

" Enable code folding based on start and end markers
set foldmethod=marker

" Allows you to delete whitespace characters, line breaks and cursor movements in insert mode
set backspace=2
set backspace=indent,eol,start

" Configure the autocompletion options to display a drop-down menu with a single option, without automatically inserting the text and without automatically selecting the first option
set completeopt=menuone,noinsert,noselect

" Defines the height of the command line to 1 line
set cmdheight=1

" Defines the update delay for asynchronous operations in milliseconds
set updatetime=300

" Configure smart and case insensitive search, with search results highlighted
set smartcase
set ignorecase
set hlsearch
set incsearch

" Removes short information messages for certain operations
set shortmess+=c

" Disable the display of the mode and command at the bottom of the screen
set noshowmode
set noshowcmd

" Disable automatic line wrapping and deferred display update when scrolling
set nowrap
set nolazyredraw

" Disable the creation of backup files and swap files
set noswapfile
set nowritebackup

" Opens new windows below and to the right of the active window
set splitbelow splitright

" Enable automatic indentation when creating new lines
set autoindent

" Defines the tab width to 2 characters, the soft indentation width to 2 characters and the automatic offset width to 2 characters
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Displays a ruler at the bottom of the screen indicating the line number and cursor column
set ruler

" Displays line numbers
set number

" Displays relative line numbers relative to the current line
set relativenumber

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Displays a column of signs with numbers if the Neovim version is greater than or equal to 0.5.0 or if patch 8.1.1564 is applied
  set signcolumn=number
else
  " Displays a column of signs without numbers
  set signcolumn=yes
endif

" Enable vertical view when using the diff command to compare files
set diffopt+=vertical

" Enable syntax highlighting
syntax on

" Defines the color scheme for a dark background
set background=dark

" Enable TrueColor (24-bit) color support if the terminal supports it, and set the terminal color count to 256
set notermguicolors
set t_Co=256

" Defines the color scheme
" colorscheme codedark

" Defines the background color in Normal mode without background color in the graphical interface and in the terminal
" hi Normal guibg=NONE ctermbg=NONE

" Defines the character used for the leader of keyboard shortcuts
let mapleader=' '

" Disable the netrw banner
" let g:netrw_banner=0

" Associate the <tab> key with the :bn command to switch to the next buffer
nmap <tab> :bn<cr>

" Associate the <s-tab> key with the :bp command to switch to the previous buffer
nmap <s-tab> :bp<cr>

" Associate the <leader>qq combination with the :bd command to close the current buffer
nmap <leader>qq :bd<cr>

" Associate the <leader>b combination with the :split command to open a new horizontal split
map <leader>b :split<cr>

" Associate the <leader>v combination with the :vsplit command to open a new vertical split
map <leader>v :vsplit<cr>

" Associate the <leader>h key combination with the <c-w><c-h> command to switch to the left window
nnoremap <leader>h <c-w><c-h>

" Associate the <leader>j key combination with the <c-w><c-j> command to switch to the bottom window
nnoremap <leader>j <c-w><c-j>

" Associate the <leader>k key combination with the <c-w><c-k> command to switch to the top window
nnoremap <leader>k <c-w><c-k>

" Associate the <leader>l key combination with the <c-w><c-l> command to switch to the right window
nnoremap <leader>l <c-w><c-l>

" Associate the <leader>left key combination with the <c-w><c-h> command to switch to the left window
nnoremap <leader><left> <c-w><c-h>

" Associate the <leader>down key combination with the <c-w><c-j> command to switch to the bottom window
nnoremap <leader><down> <c-w><c-j>

" Associate the <leader>up key combination with the <c-w><c-k> command to switch to the top window
nnoremap <leader><up> <c-w><c-k>

" Associate the <leader>right key combination with the <c-w><c-l> command to switch to the right window
nnoremap <leader><right> <c-w><c-l>

" Redefines the 'x' command to delete the character under the cursor and place it in the '_' register (black hole)
noremap x "_x

" Redefines the 'X' command to delete the previous character and place it in the '_' register (black hole)
noremap X "_x

" Redefines the '(' command to insert a pair of parentheses and position the cursor between them
" inoremap ( ()<left>

" Redefines the '{' command to insert a pair of braces and position the cursor between them
" inoremap { {}<left>

" Redefines the '[' command to insert a pair of brackets and position the cursor between them
" inoremap [ []<left>

" Defines the configuration of the Lightline plugin
" let g:lightline = {
"   \ 'active': {
"   \   'left': [ [ 'mode', 'paste' ],
"   \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"   \ },
"   \ 'component_function': {
"   \   'gitbranch': 'gitbranch#name'
"   \ },
"   \ 'colorscheme': 'codedark',
"   \ }

" Defines the configuration of the Colorizer plugin
" lua require 'colorizer'.setup()

" Associate the <leader>m key to the :MaximizerToggle! command to toggle the window maximization state
" nnoremap <leader>m :MaximizerToggle!<cr>

" Defines the configuration of the Neoterm plugin
" let g:neoterm_default_mod='vertical'
" let g:neoterm_size=60
" let g:neoterm_autoinsert=1

" Redefines the toggle keys for the Ttoggle plugin (to be uncommented if the plugin is installed)
" nnoremap <c-w> :Ttoggle<cr>
" inoremap <c-w> <esc>:Ttoggle<cr>
" tnoremap <c-w> <c-\><c-n>:Ttoggle<cr>

" Associate the <leader>gg combination with the :G command (used by the Git plugin)
" nnoremap <leader>gg :G<cr>
