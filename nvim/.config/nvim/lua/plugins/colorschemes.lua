local function gruvbox_config()
    require("gruvbox").setup({
        contrast = "hard",
    })
end

local function rose_pine_config()
    require("rose-pine").setup({
        rose_pine_disable_italic_comment = true,
    })
end

return {
    "embark-theme/vim",
    "ayu-theme/ayu-vim",
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
    "rebelot/kanagawa.nvim",

    {
        "ellisonleao/gruvbox.nvim",
        config = gruvbox_config,
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = rose_pine_config,   
    },
}
