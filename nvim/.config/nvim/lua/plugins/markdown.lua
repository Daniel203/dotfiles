return {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = {"MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle"},
    build = "cd app && npm install",
    init = function () 
        vim.g.mkdp_filetypes = { "markdown" } 
        vim.g.mkdp_echo_preview_url = 1
    end,
    ft = {"markdown"},
}
