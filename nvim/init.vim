"███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
"████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
"██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
"██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
"██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


" --------- Plugins ----------
call plug#begin('~/.vim/plugged')
" comments
Plug 'preservim/nerdcommenter'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/trouble.nvim'  " better code errors style

" completion and auto-brackets
Plug 'nvim-lua/completion-nvim'
Plug 'windwp/nvim-autopairs'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" tmux & vim moves
Plug 'christoomey/vim-tmux-navigator'

" file tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" theme
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()


" --------- Colorscheme ----------
set termguicolors
"colorscheme gruvbox
let ayucolor="dark"
colorscheme ayu


" --------- Keymaps ----------
let mapleader = " "

" copy to clipboard
noremap <C-c> "+yy"

" resize window
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
