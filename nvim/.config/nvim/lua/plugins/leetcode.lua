-- LeetCode
vim.keymap.set("n", "<leader>lr", ":Leet run<CR>")
vim.keymap.set("n", "<leader>li", ":Leet info<CR>")
vim.keymap.set("n", "<leader>ld", ":Leet desc<CR>")
vim.keymap.set("n", "<leader>lt", ":Leet test<CR>")

return {
    "kawre/leetcode.nvim",
    -- lazy = true,
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        lang = "python3",
        storage ={
            storage = "/home/linux/Coding/leetcode",
        },
    },
}
