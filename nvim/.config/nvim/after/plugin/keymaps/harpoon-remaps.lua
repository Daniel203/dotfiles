local silent = { silent = true }

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, silent)
vim.keymap.set("n", "<leader>o", function() require("harpoon.ui").toggle_quick_menu() end, silent)

vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end, silent)
vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_file(3) end, silent)
vim.keymap.set("n", "<C-s>", function() require("harpoon.ui").nav_file(4) end, silent)
