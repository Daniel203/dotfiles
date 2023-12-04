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
    "embark-theme/vim",
    "ayu-theme/ayu-vim",
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
    'ribru17/bamboo.nvim',
    'savq/melange-nvim',
    'projekt0n/github-nvim-theme',
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = kanagawa_config,
    },
    {
        "gruvbox-community/gruvbox",
        config = gruvbox_config,
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = rose_pine_config,
    },
}
