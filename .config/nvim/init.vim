let mapleader = ","

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set nowrap                  " no word wrap
set wildmode=longest,list,full   " get bash-like tab completions
set number relativenumber


filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'

call plug#end()

colorscheme gruvbox
syntax enable

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
map <C-n> :NERDTreeToggle<CR>
