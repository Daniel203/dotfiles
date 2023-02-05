require("telescope").load_extension("git_worktree")
local telescope = require("telescope")

vim.keymap.set("n", "<leader>gwc", telescope.extensions.git_worktree.create_git_worktree, {});
vim.keymap.set("n", "<leader>gws", telescope.extensions.git_worktree.git_worktrees, {});
