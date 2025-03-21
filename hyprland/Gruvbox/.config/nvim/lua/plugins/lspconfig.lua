return {
    'neovim/nvim-lspconfig',
    config = function()
        require('lspconfig').bashls.setup({})

        require('lspconfig').clangd.setup({})

        require('lspconfig').lua_ls.setup({})

        require('lspconfig').jsonls.setup({})
    end
}
