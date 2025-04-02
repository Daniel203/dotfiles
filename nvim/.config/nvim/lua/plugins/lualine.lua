local function lualine_config()
    require("lualine").setup {
        options = {
            section_separators = '',
            component_separators = '',
        },
        extensions = {
            "quickfix",
            "fugitive",
            "nvim-dap-ui",
            "oil",
        }
    }
end

return {
    "hoob3rt/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    config = lualine_config,
}
