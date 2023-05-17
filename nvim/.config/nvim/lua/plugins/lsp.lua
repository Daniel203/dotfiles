local lsp_zero_dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
}

local function lsp_zero_config()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    })

    lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>fl", "<cmd>LspZeroFormat<CR>")
        vim.keymap.set("v", "<leader>fl", vim.lsp.buf.format)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    end)

    lsp.ensure_installed({
        "efm",
        "lua_ls",
        "rust_analyzer",
    })

    -- Fix Undefined global "vim"
    lsp.configure("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    })

    -- setup nvim-cmp and luasnip
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    -- local has_words_before = function()
    --     unpack = unpack or table.unpack
    --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    -- end

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
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

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })


    -- setup lsp
    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = true,
    })
end

return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = lsp_zero_dependencies,
    config = lsp_zero_config,
}
