local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local set_indent = augroup('SetIndent', { clear = true })
autocmd('Filetype', {
  group = set_indent,
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'vue', 'tsx', 'markdown'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
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

