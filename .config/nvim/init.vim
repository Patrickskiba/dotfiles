let mapleader = ","

" ============================================================================== "
" ===                                 GENERAL                                === "
" ============================================================================== "

" Disable compatibility to old-time vi
set nocompatible            

" Show matching brackets.
set showmatch               

" Do case insensitive matching
set ignorecase              

" middle-click paste with mouse
set mouse=v                 

" highlight search results
set hlsearch                

" number of columns occupied by a tab character
set tabstop=2               

" see multiple spaces as tabstops so <BS> does the right thing
set softtabstop=2           

" converts tabs to white space
set expandtab               

" width for autoindents
set shiftwidth=2            

" indent a new line the same amount as the line just typed
set autoindent              

" no word wrap
set nowrap                  

" get bash-like tab completions
set wildmode=longest,list,full   

" line numbers should be relative to current cursor line
set number relativenumber

" vim path should automatically be set to working directory
set autochdir

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

" Enable backups with a designated folder
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup

" Dont create annoying swap files that cause messages to popup when opening
" files
set noswapfile

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'

call plug#end()

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
map <C-n> :NERDTreeToggle<CR>

" Hightlight syntax with the grubbox theme
colorscheme gruvbox
syntax enable


" ============================================================================ "
" ===                    COC.NVIM SETTINGS.                                === "
" ============================================================================ "

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile


" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "


" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif

