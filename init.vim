syntax on
filetype plugin indent on
" Leader key
let mapleader=" "

source ~/.config/nvim/plug.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/shortcuts.vim

set noerrorbells
set noshowmode " airline will show the mode
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set textwidth=0 wrapmargin=0
set scrolloff=3
set termguicolors
set mouse=
set clipboard+=unnamedplus
set hidden

" Theme - gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'

" Theme - airline
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1 " vim-airline show buffers by default
let g:airline#extensions#tabline#buffer_nr_show = 1 " vim-airline show buffer numbers
let g:airline_powerline_fonts = 1 " allow powerline symbols

colorscheme gruvbox

" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" NERDCommenter
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" delimitMate
let delimitMate_expand_cr = 1
