vim.opt.background = "dark"

-- set colorscheme
vim.cmd.colorscheme("rose-pine");

-- set comments in italic
vim.cmd("highlight Comment cterm=italic gui=italic");

-- highlight the current line number
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "Cursorline", { ctermbg = 0 })
