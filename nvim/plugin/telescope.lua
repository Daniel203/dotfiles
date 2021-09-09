local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
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

require("telescope").load_extension("fzy_native")


local cmd = vim.cmd
cmd[[nnoremap <leader>ff <cmd>Telescope find_files<cr>]]
cmd[[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]]
cmd[[nnoremap <leader>fb <cmd>Telescope buffers<cr>]]
cmd[[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]]

