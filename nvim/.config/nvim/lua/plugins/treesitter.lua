local function treesitter_config() 
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "rust", "python", "lua", "json", "html" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = { enable = true },
    }
end



return {
    "nvim-treesitter/nvim-treesitter",
    config = treesitter_config,
}
