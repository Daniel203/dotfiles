local function gruvbox_config()
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "hard"
end

local function rose_pine_config()
    require("rose-pine").setup({
        disable_italics = true,
    })
end

local function kanagawa_config()
    require("kanagawa").setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
    })
end

return {
    {
        "embark-theme/vim",
        lazy = true,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
    },
    {
        "catppuccin/nvim",
        lazy = true,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        config = kanagawa_config,
    },
    {
        lazy = true,
        "gruvbox-community/gruvbox",
        config = gruvbox_config,
    },
    {
        "rose-pine/neovim",
        lazy = true,
        priority = 1000,
        config = rose_pine_config,
    },
}
