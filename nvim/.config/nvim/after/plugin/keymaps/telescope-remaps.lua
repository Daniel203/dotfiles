local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>");
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>");
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>");
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>");
