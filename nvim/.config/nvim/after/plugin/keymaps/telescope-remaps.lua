local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {});
vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {});
vim.keymap.set("n", "<leader>fb", builtin.buffers, {});
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {});

vim.keymap.set("n", "gr", builtin.lsp_references, {});
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {});
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, {});
vim.keymap.set("n", "<leader>sw", builtin.grep_string, {});
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {});
