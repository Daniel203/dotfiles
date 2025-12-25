local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- set colorscheme based on system theme
-- vim.cmd.colorscheme("github_dark_high_contrast");
vim.cmd.colorscheme("monokai-pro-spectrum");

-- highlight the current line
vim.opt.cursorline = true
