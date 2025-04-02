local telescope_remaps = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end },
    { "<leader>fp", function() require("telescope.builtin").git_files() end },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end },
    { "<leader>fb", function() require("telescope.builtin").buffers() end },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end },
    { "<leader>sw", function() require("telescope.builtin").grep_string() end },
    { "<leader>fd", function() require("telescope.builtin").diagnostics() end },
    { "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end },

    {
        "<leader>gr", function()
        require("telescope.builtin").lsp_references({
            show_line = false,
            include_declaration = true,
            layout_strategy = "vertical",
            layout_config = { width = 0.6 }
        })
    end
    },
    {
        "<leader>ws", function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
            show_line = false,
        })
    end
    },
}

local telescope_config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            file_ignore_patterns = { "node_modules", "bin", "obj", "dll", "dist", "packages", "target", "docs" },
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case'
            },
            file_sorter = require("telescope.sorters").get_fzy_sorter,
            prompt_prefix = " >",
            color_devicons = true,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous
                },
            },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            },
        }
    })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        keys = telescope_remaps,
        init = telescope_config,
    },
}
