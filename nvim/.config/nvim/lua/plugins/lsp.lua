local function config()
    require("mason-lspconfig").setup {
        automatic_enable = true
    }

    vim.lsp.enable("dartls")

end

return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = config
}
