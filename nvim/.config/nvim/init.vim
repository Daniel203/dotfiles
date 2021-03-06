"███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
"████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
"██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
"██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
"██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


" --------- Plugins ----------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" comments
Plug 'preservim/nerdcommenter'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
"vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"  completion and auto-brackets
"Plug 'nvim-lua/completion-nvim'
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

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

" Undotree
Plug 'mbbill/undotree'

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
set background=dark

let g:gruvbox_contrast_dark="hard"
"colorscheme gruvbox

" ayucolor: dark, light, mirage 
colorscheme ayu
let ayucolor="dark"


" --------- Keymaps ----------
let mapleader = " "

" copy and paste to/from clipboard
noremap <C-c> "+y
noremap <C-p> "+p

" resize window
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>


" github copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
