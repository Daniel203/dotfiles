local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>fl", "<cmd>LspZeroFormat<CR>")

    vim.keymap.set("n", 'gd', vim.lsp.buf.definition)
    vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references)
    vim.keymap.set("n", 'gI', vim.lsp.buf.implementation)
    vim.keymap.set("n", '<leader>D', vim.lsp.buf.type_definition)
    vim.keymap.set("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols)
    vim.keymap.set("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)


    -- format on save if possiblse
    if client.server_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePre *.* LspZeroFormat]]
        vim.cmd [[augroup END]]
    end
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
