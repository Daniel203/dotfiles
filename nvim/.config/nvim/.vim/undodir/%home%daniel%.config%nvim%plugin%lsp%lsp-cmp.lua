Vim�UnDo� ���x��H7E؂V��[�jn�t4�L4[U�      Y      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),      	      %       %   %   %    am��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             am�    �                   �               5��                    )                            5�_�                            ����                                                                                                                                                                                                                                                                                                                                      *          V       am�    �              (     cmp.setup({       snippet = {         expand = function(args)           -- For `vsnip` user.   ,        vim.fn["vsnip#anonymous"](args.body)               -- For `luasnip` user.   3        -- require('luasnip').lsp_expand(args.body)                -- For `ultisnips` user.   .        -- vim.fn["UltiSnips#Anon"](args.body)   
      end,       },       mapping = {   .      ['<C-d>'] = cmp.mapping.scroll_docs(-4),   -      ['<C-f>'] = cmp.mapping.scroll_docs(4),   -      ['<C-Space>'] = cmp.mapping.complete(),   &      ['<C-e>'] = cmp.mapping.close(),   8      ['<CR>'] = cmp.mapping.confirm({ select = true }),       },       sources = {         { name = 'nvim_lsp' },             -- For vsnip user.         { name = 'vsnip' },             -- For luasnip user.         -- { name = 'luasnip' },             -- For ultisnips user.          -- { name = 'ultisnips' },             { name = 'buffer' },       }     })         -- Setup lspconfig.   1  require('lspconfig')[%YOUR_LSP_SERVER%].setup {   k    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())     }5��                                                �                          &                      �                         2                     �                         L                     �                         e                     �                         �                     �    	                     �                     �                         �                     �                         �                     �                         #                    �                          *                     �                          -                     �                         9                    �                         d                    �                         �                    �                         �                    �                         �                    �                                               �                                               �                                             �                         9                    �                         N                    �                         e                    �                         |                    �                         �                    �                          �                    �    "                     �                    �    #                      �                     �    $                      �                     �    &                      �                     �    '                                            �    (                      0                     �    )                      �                     5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	                    V       am�     �      	              -- For `luasnip` user.   /    -- require('luasnip').lsp_expand(args.body)           -- For `ultisnips` user.   *    -- vim.fn["UltiSnips#Anon"](args.body)5��                          �       �               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	          	          V       am�    �                 5��                          �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am�     �                  -- For vsnip user.5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       am�     �                 5��                          �                     5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                 V       am�%     �         "        -- For luasnip user.5��                          �                     5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V        am�'     �                 -- For luasnip user.     -- { name = 'luasnip' },         -- For ultisnips user.     -- { name = 'ultisnips' },5��                          �      h               5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        am�(    �                     5��                          �                     5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                  V        am�G     �               gcapabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())5��                                               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        am�I     �               k    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())5��                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        am�I    �               j   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())5��                                              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        am�v     �                -- Setup lspconfig.   /require('lspconfig')[%YOUR_LSP_SERVER%].setup {   i  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())   }5��                          �      �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        am�{    �               snippet = {     expand = function(args)       -- For `vsnip` user.   (    vim.fn["vsnip#anonymous"](args.body)     end,   },   mapping = {   *  ['<C-d>'] = cmp.mapping.scroll_docs(-4),   )  ['<C-f>'] = cmp.mapping.scroll_docs(4),   )  ['<C-Space>'] = cmp.mapping.complete(),   "  ['<C-e>'] = cmp.mapping.close(),   4  ['<CR>'] = cmp.mapping.confirm({ select = true }),   },   sources = {     { name = 'nvim_lsp' },     { name = 'vsnip' },     { name = 'buffer' },   }5��                          &                      �                         6                     �                         T                     �                         q                     �                         �                     �                          �                      �    	                      �                      �    
                     �                     �                         �                     �                                             �                         K                    �                         r                    �                          �                     �                          �                     �                         �                    �                         �                    �                         �                    �                                               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        am�}     �   
                },�             �   
             .      ['<C-d>'] = cmp.mapping.scroll_docs(-4),   -      ['<C-f>'] = cmp.mapping.scroll_docs(4),   -      ['<C-Space>'] = cmp.mapping.complete(),   &      ['<C-e>'] = cmp.mapping.close(),   8      ['<CR>'] = cmp.mapping.confirm({ select = true }),5��    
                      �       �               �    
                     �               ^      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̅     �   
         	   S['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),   U  ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),   V  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),   T  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),   *  ['<C-d>'] = cmp.mapping.scroll_docs(-4),   )  ['<C-f>'] = cmp.mapping.scroll_docs(4),   )  ['<C-Space>'] = cmp.mapping.complete(),   "  ['<C-e>'] = cmp.mapping.close(),   "  ['<CR>'] = cmp.mapping.confirm({5��    
                      �                      �                                             �                         r                    �                         �                    �                         &                    �                         U                    �                         �                    �                         �                    �                         �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       aṁ     �   
            W    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),5��    
                      �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       am̈     �   
            S['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),5��    
                      �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̉    �   
            W    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),5��    
                     �                      �    
                    �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       am̒     �               +    behavior = cmp.ConfirmBehavior.Replace,       select = true,5��                                             �                         1                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̓     �               
  })    },5��                       M                    �                         N                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̖     �                   },5��                         P                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̖     �                  },5��                         P                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̗     �                 }) 5��                         J                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       am̜     �                 },5��                         R                     5�_�      !                     ����                                                                                                                                                                                                                                                                                                                                                V       am̟    �                   }) 5��                         L                     5�_�      "           !      	    ����                                                                                                                                                                                                                                                                                                                                                V       am��     �   
            Y      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),5��    
   	                 �                     5�_�   !   $           "      	    ����                                                                                                                                                                                                                                                                                                                                                V       am��     �   
            Y      ['<i-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),5��    
   	                 �                     5�_�   "   %   #       $      	    ����                                                                                                                                                                                                                                                                                                                                                V       am��    �               Y      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),5��       	                 #                    �                        )                    5�_�   $               %      
    ����                                                                                                                                                                                                                                                                                                                                                V       am��    �               _      ['<Shift-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),5��       
                  $                     5�_�   "           $   #      	    ����                                                                                                                                                                                                                                                                                                                                                V       am��     �               _      ['<Tab-Shifg>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),5��       	              	   #             	       5�_�              !              ����                                                                                                                                                                                                                                                                                                                                                V       am̤     �               0      j  behavior = cmp.ConfirmBehavior.Replace,5��                                              5�_�                     	    ����                                                                                                                                                                                                                                                                                                                                                  V        am��     �   
            .      ['<Tab>'] = cmp.mapping.scroll_docs(-4),5��    
   	                 �                     5�_�                        	    ����                                                                                                                                                                                                                                                                                                                                                  V        am��    �               3      ['<Shift-Tab>'] = cmp.mapping.scroll_docs(4),5��       	              	   �              	       5�_�                      	    ����                                                                                                                                                                                                                                                                                                                                                  V        am��     �   
            3      ['<Tab    j>'] = cmp.mapping.scroll_docs(-4),5��    
   	                 �                     5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                  V        am��   	 �               )      ['<Tab>'] = cmp.mapping.complete(),5��       	                 &                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       am�     �              5��                          �      j               5��