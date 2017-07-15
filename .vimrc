" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set shiftwidth=4   " using tab will produce 4 spaces
set ruler          " display line and column number
set noshowmode     " do not display current mode since airline plugin will
set updatetime=750 " swapfile flush interval - also affects some plugins
set hidden         " allow buffers that are not visible to remain open
set ignorecase     " ignore case when searching
set smartcase      " don't ignore case when capital letters are in search
set undolevels=20000               " max number of undos
set tabstop=4
set expandtab
set smarttab

" Plugged
call plug#begin()
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'        " status bar
Plug 'vim-airline/vim-airline-themes' " status bar themes
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'             " file fuzzyfinder
Plug 'ervandew/supertab'              " smart tab triggered autocomplete
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim',  { 'do': 'npm install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-fugitive'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'benmills/vimux'
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'tpope/vim-obsession', { 'do' : 'vim -u NONE -c \"helptags vim-obsession/doc\" -c q'}
" Plug 'vim-scripts/FuzzyFinder'
Plug 'rking/ag.vim'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-markdown-preview', { 'do': 'sh install.sh' }
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Recover.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'digitaltoad/vim-pug'
" Plug 'christoomey/vim-conflicted'
call plug#end()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
  set undodir=~/.config/nvim/undodir " undo file dir
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
  " set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
colorscheme delek
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" enable line numbers
set number
" set relative line numbers
" set rnu

" Set airline theme
let g:airline_theme='powerlineish'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" colors
highlight NeoMakeErrorSign ctermfg=Red cterm=underline
highlight NeoMakeErrorDefault ctermfg=Red cterm=underline
highlight NeoMakeWarningSign ctermfg=214 cterm=underline
highlight NeoMakeWarningDefault ctermfg=214 cterm=underline

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" vim-airline show buffers by default
let g:airline#extensions#tabline#enabled = 1

" vim-airline show buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1

" allow powerline symbols
let g:airline_powerline_fonts = 1

" ctrlp respect .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', 'public/', 'node_modules/']

" change leader
let mapleader = " "

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" remap home and end to esc cause my keyboard is weird
map <home> <esc>
map <end> <esc>
map! <home> <esc>
map! <end> <esc>

" Shortcuts for Vimux
map <Leader>rr :VimuxPromptCommand<CR>
map <Leader>rt :VimuxRunCommand("npm run test")<CR>
map <Leader>rc :VimuxCloseRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>

" Tab shortcuts
map <Leader>tl :tabnext<CR>
map <Leader>th :tabprevious<CR>
map <Leader>tn :tabnew<CR>
map <Leader>tw :tabclose<CR>

" Buffer shortcuts
map <Leader>bl :bn<CR>
map <Leader>bh :bp<CR>
map <Leader>bn :new<CR>
map <Leader>bw :bwipeout<CR>

" Disable search highlighting after search
map <Leader>/ :noh<CR>

" Shortcut to write
map <Leader>w :w<CR>

" Project searching
nmap <Leader>gg :grep
nmap <silent> <Leader>gl :cnext<CR>
nmap <silent> <Leader>gh :cprev<CR>

" bind <Leader>d to grep word under cursor
nnoremap <Leader>d :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Syntastic settings
let g:syntastic_javascript_checkers=['eslint']

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" NERDTree Git Options
let g:NERDTreeUpdateOnCursorHold = 0

" Markdown keyboard shortcut
map <Leader>p :Mm<CR>

" NERDTreeToggle shortcut
map <Leader>n :NERDTreeToggle<CR>
" indentLine
let g:indentLine_faster = 1
let g:indentLine_setConceal = 1
" let g:indentLine_char = '|'
set list lcs=tab:\|\

" delimitmate new line on curly braces and stuff
let delimitMate_expand_cr = 1

" Indent Guides
colorscheme delek
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Diffget mappings
" Use `gl` and `gu` rather than the default conflicted diffget mappings
let g:diffget_local_map = '<Leader>ct'
let g:diffget_upstream_map = '<Leader>cb'

" Vim-Conflicted
set stl+=%{ConflictedVersion()}

" Tern stuff from Leo
let g:deoplete#enable_at_startup = 1
"let g:deoplete#omni#input_patterns = {}
let g:deoplete#auto_complete_start_length = 2

let g:tern_show_signature_in_pum = 0
let g:tern_show_argument_hints = 'on_hold'
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" disable tern argument hints scratch window

autocmd FileType javascript setlocal omnifunc=tern#Complete

" Clipboard
set clipboard+=unnamedplus
