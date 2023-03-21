vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    -- themes and customization
    use "hoob3rt/lualine.nvim"
    use "ryanoasis/vim-devicons"
    use "gruvbox-community/gruvbox"
    use "luisiacc/gruvbox-baby"
    use "embark-theme/vim"
    use "ayu-theme/ayu-vim"
    use "folke/tokyonight.nvim"
    use "catppuccin/nvim"
    use "rose-pine/neovim"
    use "rebelot/kanagawa.nvim"

    -- helpers
    use "preservim/nerdcommenter"
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- undotree
    use "mbbill/undotree"

    -- treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- completion and lsp
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
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
    }

    -- Debugger
    use "mfussenegger/nvim-dap"
    use "theHamsta/nvim-dap-virtual-text"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- harpoon
    use "ThePrimeagen/harpoon"

    -- Git integration
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"
    use "ThePrimeagen/git-worktree.nvim"
    use "github/copilot.vim"

    --Zen mode
    use "folke/zen-mode.nvim"

    -- Indentation lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
