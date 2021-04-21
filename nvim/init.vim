"███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
"████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
"██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
"██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
"██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


" --------- Vim configuration ----------
syntax on
set number relativenumber

" Indentation
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

set cursorline
set noerrorbells
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set undodir=~/.vim/undodir
set undofile
"set spell
set encoding=UTF-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" --------- Plugins ----------
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'

" tmux & vim moves
Plug 'christoomey/vim-tmux-navigator'

" python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" themes
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'

Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

call plug#end()



" --------- Key Maps ----------
let mapleader = " "

" fzf
nnoremap <C-p> :Files<CR>

" copy
noremap <C-c> "+yy"

" undotree
nnoremap <leader>u :UndotreeShow<CR>

" move lines
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

" resize windows
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" remove highligth after search
"nnoremap <silent> <C-l> :nohl<CR><C-l>

" pydocstring
nmap <silent> <leader>pd <Plug>(pydocstring)

" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n>



" --------- Plugins Configuration ----------
" vim colorscheme
set termguicolors
set background=dark
"let g:gruvbox_contrast_dark = 'hard'
let g:neodark#background = '#202020'
colorscheme neodark

" airline
source $HOME/.config/nvim/plug-config/airline.vim

" coc
source $HOME/.config/nvim/plug-config/coc.vim

" coc extensions
let g:coc_global_extensions = [
    \ 'coc-python',
    \ 'coc-explorer',
    \ 'coc-marketplace',
    \ 'coc-vimlsp'
  \ ]

" signigfy
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
let g:signify_sign_change = '~'
