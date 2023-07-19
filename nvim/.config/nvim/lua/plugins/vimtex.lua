local vimtex_config = function ()
    vim.g.vimtex_view_method = 'zathura'

    -- vim.g.vimtex_view_general_viewer = 'okular'

    -- vim.g.vimtex_compiler_method = 'latexrun'
    --
    -- -- vim.api.nvim_set_var('maplocalleader', ',')
end

return {
    "lervag/vimtex",
    config = vimtex_config,
}
