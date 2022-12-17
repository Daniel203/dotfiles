local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'efm',
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = true,
})

-- Format on save
vim.cmd [[autocmd BufWritePre *.* LspZeroFormat]]
