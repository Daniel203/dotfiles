local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- set colorscheme based on system theme
vim.cmd.colorscheme("kanso");

-- highlight the current line
vim.opt.cursorline = true
