local function treesitter_config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "rust", "python", "lua", "json", "html", "vimdoc" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = "<TAB>",
                node_decremental = "<S-TAB>",
            },
        },
    }
end



return {
    "nvim-treesitter/nvim-treesitter",
    config = treesitter_config,
}
