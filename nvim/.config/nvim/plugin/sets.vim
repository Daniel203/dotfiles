" --------- Vim configuration ----------
syntax on
set number relativenumber

" Indentation
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

" Indentaions for specific files
autocmd FileType c setlocal ts=2 sts=2 sw=2
autocmd FileType cpp setlocal ts=2 sts=2 sw=2
autocmd FileType h setlocal ts=2 sts=2 sw=2

set noshowmode
set cursorline
set noerrorbells
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set undodir=~/.config/nvim/.vim/undodir
set undofile
set scrolloff=8
set ttimeoutlen=100
set updatetime=200
set encoding=UTF-8

set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey

set cmdheight=2
