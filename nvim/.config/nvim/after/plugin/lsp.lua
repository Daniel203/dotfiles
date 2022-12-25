local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>fl", "<cmd>LspZeroFormat<CR>")

    -- format on save
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePre *.* LspZeroFormat]]
    vim.cmd [[augroup END]]
end)


lsp.ensure_installed({
    'efm',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = true,
})
