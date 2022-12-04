local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Toggle explorer
nnoremap("<leader>e", "<cmd>Ex<CR>");

-- Undotree
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- Paste without resetting the paste buffer
xnoremap("<leader>p", "\"_dP")

-- Set center when using <C-d> and <C-U>
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Set center when going to next or previous searched element
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Move the lines up and down
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- Move to another window
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>l", "<C-w>l")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
