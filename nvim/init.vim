" Active le gestionnaire de plugins vim-plug
call plug#begin()
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Désactive le mode de compatibilité
if &compatible
  set nocompatible
endif

" Active la détection automatique du type de fichier, des plugins associés et de l'indentation automatique
filetype plugin indent on

" Définit l'encodage des fichiers en UTF-8
set encoding=utf8

" Configure le menu de langue en français
set langmenu=fr_FR
let $LANG='fr_FR'

" Définit le format de fichier par défaut en format Unix (LF uniquement)
set fileformat=unix

" Cache les buffers au lieu de les fermer lors du passage à un autre buffer
set hidden

" Active la prise en charge de la souris dans Vim
set mouse=a

" Définit une marge de défilement de 5 lignes
set scrolloff=5

" Active le presse-papiers système pour copier/coller avec le presse-papiers universel
" set clipboard=unnamedplus

" Active le pliage de code basé sur les marqueurs de début et de fin
set foldmethod=marker

" Permet de supprimer les caractères d'espacement, les retours à la ligne et les déplacements du curseur en mode insertion
set backspace=2
set backspace=indent,eol,start

" Configure les options d'autocomplétion pour afficher un menu déroulant avec une seule option, sans insérer automatiquement le texte et sans sélectionner automatiquement la première option
set completeopt=menuone,noinsert,noselect

" Définit la hauteur de la ligne de commande à 1 ligne
set cmdheight=1

" Définit le délai de mise à jour pour les opérations asynchrones en millisecondes
set updatetime=300

" Configure la recherche intelligente et insensible à la casse, avec mise en surbrillance des résultats de recherche
set smartcase
set ignorecase
set hlsearch
set incsearch

" Supprime les messages d'informations courts pour certaines opérations
set shortmess+=c

" Désactive l'affichage du mode et de la commande en bas de l'écran
set noshowmode
set noshowcmd

" Désactive le retour automatique à la ligne et la mise à jour différée de l'affichage lors du défilement
set nowrap
set nolazyredraw

" Désactive la création de fichiers de sauvegarde et de fichiers d'échange
set noswapfile
set nowritebackup

" Ouvre les nouvelles fenêtres en dessous et à droite de la fenêtre active
set splitbelow splitright

" Active l'indentation automatique lors de la création de nouvelles lignes
set autoindent

" Définit la largeur des tabulations à 2 caractères, la largeur de l'indentation souple à 2 caractères et la largeur du décalage automatique à 2 caractères
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Affiche une règle en bas de l'écran indiquant le numéro de ligne et la colonne du curseur
set ruler

" Active l'affichage des numéros de ligne
set number

" Active l'affichage des numéros de ligne relatifs par rapport à la ligne courante
set relativenumber

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Affiche une colonne de signes avec des numéros si la version de Neovim est supérieure ou égale à 0.5.0 ou si le patch 8.1.1564 est appliqué
  set signcolumn=number
else
  " Affiche une colonne de signes sans numéros
  set signcolumn=yes
endif

" Active la vue verticale lors de l'utilisation de la commande diff pour comparer des fichiers
set diffopt+=vertical

" Active la coloration syntaxique
syntax on

" Définit le thème de couleur pour un fond sombre
set background=dark

" Active la prise en charge des couleurs TrueColor (24 bits) si le terminal le permet, et définit le nombre de couleurs du terminal à 256
set notermguicolors
set t_Co=256

" Définit le thème de couleur "dim"
colorscheme dim 

" Définit la couleur d'arrière-plan en mode Normal sans couleur de fond dans l'interface graphique et dans le terminal
" hi Normal guibg=NONE ctermbg=NONE

" Définit le caractère utilisé pour le leader des raccourcis clavier
let mapleader=' '

" Désactive la bannière netrw
" let g:netrw_banner=0

" Associe la touche <tab> à la commande :bn pour passer au buffer suivant
nmap <tab> :bn<cr>

" Associe la combinaison <s-tab> à la commande :bp pour passer au buffer précédent
nmap <s-tab> :bp<cr>

" Associe la combinaison <leader>qq à la commande :bd pour fermer le buffer courant
nmap <leader>qq :bd<cr>

" Associe la combinaison <leader>b à la commande :split pour ouvrir un nouveau split horizontal
map <leader>b :split<cr>

" Associe la combinaison <leader>v à la commande :vsplit pour ouvrir un nouveau split vertical
map <leader>v :vsplit<cr>

" Associe la combinaison de touches <c-h> à la commande <c-w><c-h> pour basculer vers la fenêtre de gauche
nnoremap <c-h> <c-w><c-h>

" Associe la combinaison de touches <c-j> à la commande <c-w><c-j> pour basculer vers la fenêtre du bas
nnoremap <c-j> <c-w><c-j>

" Associe la combinaison de touches <c-k> à la commande <c-w><c-k> pour basculer vers la fenêtre du haut
nnoremap <c-k> <c-w><c-k>

" Associe la combinaison de touches <c-l> à la commande <c-w><c-l> pour basculer vers la fenêtre de droite
nnoremap <c-l> <c-w><c-l>

" Associe la combinaison de touches <c-left> à la commande <c-w><c-h> pour basculer vers la fenêtre de gauche
nnoremap <c-left> <c-w><c-h>

" Associe la combinaison de touches <c-down> à la commande <c-w><c-j> pour basculer vers la fenêtre du bas
nnoremap <c-down> <c-w><c-j>

" Associe la combinaison de touches <c-up> à la commande <c-w><c-k> pour basculer vers la fenêtre du haut
nnoremap <c-up> <c-w><c-k>

" Associe la combinaison de touches <c-right> à la commande <c-w><c-l> pour basculer vers la fenêtre de droite
nnoremap <c-right> <c-w><c-l>

" Redéfinit la commande 'x' pour supprimer le caractère sous le curseur et le placer dans le registre '_' (black hole)
noremap x "_x

" Redéfinit la commande 'X' pour supprimer le caractère précédent et le placer dans le registre '_' (black hole)
noremap X "_x

" Redéfinit la commande '(' pour insérer une paire de parenthèses et positionner le curseur entre elles
" inoremap ( ()<left>

" Redéfinit la commande '{' pour insérer une paire d'accolades et positionner le curseur entre elles
" inoremap { {}<left>

" Redéfinit la commande '[' pour insérer une paire de crochets et positionner le curseur entre eux
" inoremap [ []<left>

" Configuration de Lightline (à décommenter et personnaliser selon vos besoins)
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

" Configuration du plugin Colorizer (à décommenter si le plugin est installé)
" lua require 'colorizer'.setup()

" Associe la touche <leader>m à la commande :MaximizerToggle! pour basculer l'état de maximisation de la fenêtre
nnoremap <leader>m :MaximizerToggle!<cr>

" Configuration du plugin Neoterm (à décommenter et personnaliser selon vos besoins)
" let g:neoterm_default_mod='vertical'
" let g:neoterm_size=60
" let g:neoterm_autoinsert=1

" Redéfinition des touches de basculement pour le plugin Ttoggle (à décommenter si le plugin est installé)
" nnoremap <c-w> :Ttoggle<cr>
" inoremap <c-w> <esc>:Ttoggle<cr>
" tnoremap <c-w> <c-\><c-n>:Ttoggle<cr>

" Associe la combinaison <leader>gg à la commande :G (utilisé par le plugin Git)
" nnoremap <leader>gg :G<cr>
