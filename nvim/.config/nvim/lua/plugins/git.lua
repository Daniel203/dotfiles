local git_worktree_keys = {
    { "<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end },
    { "<leader>gws", function() require("telescope").extensions.git_worktree.git_worktrees() end },
}

local function git_signs_config()
    require('gitsigns').setup {
        signs = {
            -- add = { text = '+' },
            -- change = { text = '~' },
            -- delete = { text = '_' },
            -- topdelete = { text = '‾' },
            -- changedelete = { text = '~' },
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
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

return {
    -- Git integration
    "tpope/vim-fugitive",

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
        config = copilot_settings ,
    },
}
