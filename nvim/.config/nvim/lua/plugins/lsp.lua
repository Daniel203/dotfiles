local function config()
    print("Loading lsp.lua")
    local lspconfig = require('lspconfig')
    local luasnip = require("luasnip")
    local cmp = require 'cmp'

    require("luasnip.loaders.from_vscode").lazy_load()
    require('mason').setup({})

    require('mason-lspconfig').setup_handlers({
        function(server)
            lspconfig[server].setup({})
        end,
    })

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    })

    lspconfig.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    ignored = {
                        leptos_macro = {
                            "server",
                            "component",
                        },
                    },
                },
            }
        }
    })

    lspconfig.tsserver.setup({
        -- capabilities = capabilities,
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
        end,
        settings = {
            diagnostics = { ignoredCodes = { 6133, 80001 } } -- Ignore "unused variable" and "convert to ES6 module" errors
        }
    })


    -- Setup diagnostics
    vim.diagnostic.config({
        severity_sort = true,
        float = true,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>fl', function()
                vim.lsp.buf.format { async = true }
            end, opts)

            vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

            vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end,
    })

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
        })
    })
end

return {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
            }
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            }
        },
        {
            "nvimtools/none-ls.nvim",
            config = function()
                local null_ls = require("null-ls")

                local diagnostics = null_ls.builtins.diagnostics
                local formatting = null_ls.builtins.formatting

                null_ls.setup({
                    sources = {
                        formatting.prettier,
                        -- diagnostics.eslint_d,
                    },
                })

                vim.keymap.set('n', '<space>fl', function() vim.lsp.buf.format { async = true } end)
                vim.keymap.set('v', '<space>fl', function() vim.lsp.buf.format { async = true } end)
            end
        },
        { 
            "danymat/neogen", 
            config = true,
            keys = {
                { "<leader>nf", "<cmd>Neogen func<cr>", desc = "Generate documentation for functions"},
                { "<leader>nc", "<cmd>Neogen class<cr>", desc = "Generate documentation for class"},
                { "<leader>nt", "<cmd>Neogen type<cr>", desc = "Generate documentation for type"},  
            }
        }

    },

    config = config,
}
