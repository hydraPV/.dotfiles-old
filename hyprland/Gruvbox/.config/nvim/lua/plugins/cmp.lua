return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path'
    },
    config = function()
        require('cmp').setup({
            snippet = {expand = function(args) end},
            mapping = {
                ['<C-p>'] = require('cmp').mapping.select_prev_item(),
                ['<C-n>'] = require('cmp').mapping.select_next_item(),
                ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
                ['<C-u>'] = require('cmp').mapping.scroll_docs(4),
                ['<C-y>'] = require('cmp').mapping.confirm({select = true}),
                ['<C-space>'] = require('cmp').mapping.complete()
            },
            sources = {{name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}},
            completion = {completeopt = 'menu,menuone,noselect'},
            window = {
                completion = {
                    winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None'
                },
                documentation = {
                    winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None'
                }
            }
        })
    end
}
