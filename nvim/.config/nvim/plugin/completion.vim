"" Use completion-nvim in every buffer
"autocmd BufEnter * lua require'completion'.on_attach()

"" Use <C-J> and <C-k> to navigate through popup menu
"inoremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

"" Avoid showing message extra message when using completion
"set shortmess+=c

""map <tab> and <s-tab> to manually trigger completion
"imap <tab> <Plug>(completion_smart_tab)
"imap <s-tab> <Plug>(completion_smart_s_tab)

