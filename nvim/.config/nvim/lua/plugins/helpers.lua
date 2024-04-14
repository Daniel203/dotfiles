local harpoon_keys = {
    { "<leader>a", function() require("harpoon.mark").add_file() end },
    { "<leader>o", function() require("harpoon.ui").toggle_quick_menu() end },
    { "<C-h>",     function() require("harpoon.ui").nav_file(1) end },
    { "<C-t>",     function() require("harpoon.ui").nav_file(2) end },
    { "<C-n>",     function() require("harpoon.ui").nav_file(3) end },
    { "<C-s>",     function() require("harpoon.ui").nav_file(4) end },
    { "<C-A-h>",   function() require("harpoon.ui").nav_file(5) end },
    { "<C-A-t>",   function() require("harpoon.ui").nav_file(6) end },
    { "<C-A-n>",   function() require("harpoon.ui").nav_file(7) end },
    { "<C-A-s>",   function() require("harpoon.ui").nav_file(8) end },
}

local harpoon_config = function()
    require("harpoon").setup({
        menu = {
            width = vim.api.nvim_win_get_width(0) - 50,
        }
    })
end

local function indent_blankline_config()
    require('ibl').setup {
        whitespace = {
            -- highlight = highlight,
            remove_blankline_trail = false,
        },
        indent = { char = '┆', },
        scope = { enabled = false },
    }
end

return {
    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    },

    -- Autopairs brackets
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    -- Undotree
    "mbbill/undotree",

    --Zen mode
    "folke/zen-mode.nvim",

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        keys = harpoon_keys,
        config = harpoon_config,
    },

    -- Indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = indent_blankline_config,
    },

    -- Markdown
    ({
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }),
}
