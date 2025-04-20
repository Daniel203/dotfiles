-- INFO: to get help on configurations: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs

-- Enable lsp servers
vim.lsp.enable({
    "gopls",
    "lua-language-server",
    "dartls",
})

-- Attach lsp
local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        -- Remaps
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fl', function() vim.lsp.buf.format { async = true } end, opts)
        vim.keymap.set('v', '<space>fl', function() vim.lsp.buf.format { async = true } end, opts)

        vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Still doesn't work as expected, so using blink.cmp
        -- if client:supports_method('textDocument/completion') then
            -- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
        -- end
    end,
})

-- Virtual text
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- Enter to accept auto-completion
vim.cmd("inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'")

vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities(), })

