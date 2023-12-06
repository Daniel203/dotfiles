local lsp_zero_dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
}

local nvim_cmp_dependencies = {
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" }
}

local function lsp_zero_config()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(
        function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })

            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>fl", "<cmd>LspZeroFormat<CR>")
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end
    )

    lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
        handlers = {
            lsp_zero.default_setup,
        }
    })

    -- Setup diagnostics
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = true,
    })

    -- Setup rust analyzer to ignore #component and #server marcos
    lsp_zero.configure("rust_analyzer", {
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
end

-- setup nvim-cmp and luasnip
local function nvim_cmp_config()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    local cmp_mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(cmp_select),
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
    })

    cmp.setup({
        mapping = cmp_mapping,
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
        },
    })

    require("luasnip.loaders.from_vscode").lazy_load()
end

return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- LSP Support
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = lsp_zero_dependencies,
        config = lsp_zero_config,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        }
    },
    -- Autocompletion
    { "saadparwaiz1/cmp_luasnip" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = nvim_cmp_dependencies,
        config = nvim_cmp_config
    },
}
