return {
    'stevearc/conform.nvim',
    lazy = false,
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                lua = {'lua-format'},
                bash = {'beautysh'},
                sh = {'beautysh'},
                cpp = {'clang-format'},
                jsonc = {'prettier'},
                json = {'prettier'}
            },
        })
    end
}

