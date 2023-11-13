local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local set_indent = augroup('SetIndent', { clear = true })
autocmd('Filetype', {
    group = set_indent,
    pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
        'yaml', 'vue', 'json',
    },
    command = 'setlocal shiftwidth=2 tabstop=2'
})

local set_color_column = augroup('SetColorColumn', { clear = true })
autocmd('Filetype', {
    group = set_color_column,
    pattern = { 'tex' },
    command = 'setlocal colorcolumn=80'
})

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
