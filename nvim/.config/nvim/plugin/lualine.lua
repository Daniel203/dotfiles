require'lualine'.setup{
    options = {
        theme = 'ayu_dark',
        --theme = "gruvbox",
        section_separators = '',
        component_separators = '',
    },
    extensions = {
        "quickfix",
        "fugitive",
        "nvim-tree",
    }
}
