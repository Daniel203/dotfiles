-- Toggle explorer
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>");

-- Undotree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- Set center when using <C-d> and <C-U>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Set center when going to next or previous searched element
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize windows
vim.keymap.set("n", "<C-UP>", ":resize -2<CR>")
vim.keymap.set("n", "<C-DOWN>", ":resize +2<CR>")
vim.keymap.set("n", "<C-LEFT>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-RIGHT>", ":vertical resize +2<CR>")

-- Move the lines up and down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Paste without resetting the paste buffer
vim.keymap.set("x", "<leader>p", "\"_dp")

-- Copy to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Delete without overriding the clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Move up and down the quickfix list
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>zz")

-- Replace word under cursor
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
