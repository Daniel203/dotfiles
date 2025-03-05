local function treesitter_config()
    require("treesitter-context").setup {
        -- max_lines = 6,
        -- trim_scope = "outer",
        -- multiline_threshold = 2, -- Maximum number of lines to show for a single context

    }
end

return {
    "nvim-treesitter/nvim-treesitter-context",
    config = treesitter_config,
}

