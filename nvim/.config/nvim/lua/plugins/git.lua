local git_worktree_keys = {
    { "<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end },
    { "<leader>gws", function() require("telescope").extensions.git_worktree.git_worktrees() end },
}

local function git_signs_config()
    require('gitsigns').setup {
        signs = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
    }
end

local function copilot_settings()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_enabled = false
    vim.g.copilot_filetypes = { markdown = true }
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

local function fugitive_config()
    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
end

return {
    -- Git integration
    {
        "tpope/vim-fugitive",
        config = fugitive_config(),
    },

    {
        "ThePrimeagen/git-worktree.nvim",
        keys = git_worktree_keys,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = git_signs_config,
    },

    -- Copilot
    {
        "github/copilot.vim",
        config = copilot_settings,
    },
}
