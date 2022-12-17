vim.g.gruvbox_contrast_dark = "hard"
vim.opt.background = "dark"
vim.cmd("colorscheme tokyonight-night")

-- set comments in italic
vim.cmd("highlight Comment cterm=italic gui=italic");

-- highlight the current line number
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "Cursorline", { ctermbg = 0 })
