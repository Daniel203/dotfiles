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
        -- indent = { char = '┆', },
        scope = { enabled = false },
    }
end

local function oil_config()
    require("oil").setup({
        use_default_keymaps = false,
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        view_options = {
            show_hidden = true,
        }
    })
end

return {
    -- Autopairs brackets
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({ map_cr = true }) end
    },

    -- Undotree
    "mbbill/undotree",

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        keys = harpoon_keys,
        config = harpoon_config,
    },

    -- Indentation lines
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = indent_blankline_config,
    -- },

    -- Markdown
    ({
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }),
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- File Navigation/Edit
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = oil_config,
    },

    -- Change theme based on system theme
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd.colorscheme("monokai-pro-spectrum");
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd.colorscheme("github_light_high_contrast");
            end,
            update_interval = 1000,
            fallback = "dark"
        },
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

}
