vim.opt.background = "dark"

-- gruvbox
vim.g.gruvbox_contrast_dark = "hard"

-- gruvbox-baby
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "NONE"
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_use_original_palette = true

-- set colorscheme
vim.cmd("colorscheme gruvbox")

-- set comments in italic
vim.cmd("highlight Comment cterm=italic gui=italic");

-- highlight the current line number
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "Cursorline", { ctermbg = 0 })
