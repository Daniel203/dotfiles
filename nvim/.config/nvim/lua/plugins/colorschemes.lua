local function gruvbox_config()
    require("gruvbox").setup({
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = true,
        },
        contrast = "hard"
    })
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

local function catppuccin_config()
    require("catppuccin").setup({
        color_overrides = {
            macchiato = {
                base = "#000000",
                mantle = "#000000",
                crust = "#000000",
            },
        },
        no_italic = true
    })
end

return {
    {
        "embark-theme/vim",
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        "catppuccin/nvim",
        config = catppuccin_config
    },
    {
        "rebelot/kanagawa.nvim",
        config = kanagawa_config,
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = gruvbox_config,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        config = rose_pine_config,
    },
    {
        "marko-cerovac/material.nvim"
    },
    {
        "Mofiqul/vscode.nvim"
    }

}

