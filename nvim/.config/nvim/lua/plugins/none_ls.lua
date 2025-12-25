local function none_ls_config()
    local null_ls = require("null-ls")

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.clang_format,
        },
    })
end

return {
    "nvimtools/none-ls.nvim",
    config = none_ls_config
}
