local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Blink when highlight a piece of text
local highlight_yank = augroup("HihglightYank", { clear = true })
autocmd('TextYankPost', {
    group = highlight_yank,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

