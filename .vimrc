" =============================================================================
" 1. PLUGINS
" =============================================================================
call plug#begin('~/.vim/plugged')

" The Essentials
Plug 'tpope/vim-commentary'      " gcc to comment lines
Plug 'tpope/vim-surround'        " cs"' to change " to '
Plug 'tpope/vim-fugitive'        " :G to use git wrapper
Plug 'airblade/vim-gitgutter'    " Shows +/- diff markers in the column

" File Navigation (The Telescope alternative)
" Note: This tries to download the binary. If it fails, use the conda version.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" UI / Theme
Plug 'morhetz/gruvbox'           " A classic, easy-on-the-eyes theme
Plug 'vim-airline/vim-airline'   " The status bar at the bottom

" Python Indentation (Better than default)
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" =============================================================================
" 2. BASIC SETTINGS
" =============================================================================
syntax on
filetype plugin indent on

" UI Config
set number              " Show line numbers
set relativenumber      " Show relative numbers (great for jumping)
set cursorline          " Highlight current line
set scrolloff=8         " Keep 8 lines of context when scrolling
set signcolumn=yes      " Always show the sign column (prevents jumping)

" Search
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless you type a capital letter
set hlsearch            " Highlight matches
set incsearch           " Jump to matches as you type

" Tabbing (Standard 4 spaces)
set expandtab           " Use spaces instead of tabs
set shiftwidth=4        " Shift 4 spaces when tabbing
set tabstop=4           " 1 tab == 4 spaces
set smartindent         " Auto-indent new lines

" System
set undofile            " Save undo history to a file (persistent undo)
set undodir=~/.vim/undo " Save undo files here
set mouse=a             " Enable mouse support (clicking, scrolling)
set updatetime=100      " Faster update time for gitgutter

" Create undo dir if not exists
if !isdirectory(expand("~/.vim/undo"))
    call mkdir(expand("~/.vim/undo"), "p")
endif

" Colors
set background=dark
try
    colorscheme gruvbox
catch
    colorscheme desert  " Fallback if gruvbox isn't installed yet
endtry

" =============================================================================
" 3. KEY MAPPINGS
" =============================================================================
" Map Leader key to Space (Standard modern binding)
let mapleader = " "

" Fast Saving/Quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Clear search highlights with <Space> + h
nnoremap <Leader>h :nohlsearch<CR>

" Window Navigation (Ctrl+h/j/k/l instead of Ctrl+w + h/j/k/l)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" FZF Mappings (File Searching)
" <Space>f to find files
nnoremap <Leader>f :Files<CR>
" <Space>b to find open buffers
nnoremap <Leader>b :Buffers<CR>
" <Space>/ to search text in files (requires ripgrep/ag installed)
nnoremap <Leader>/ :Rg<CR>

" Resize splits with Arrow keys
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Change cursor shape based on mode
let &t_SI = "\<Esc>[6 q"  " Insert mode = vertical bar
let &t_SR = "\<Esc>[4 q"  " Replace mode = underscore
let &t_EI = "\<Esc>[2 q"  " Normal mode = block
