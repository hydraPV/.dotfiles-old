return {
    'mfussenegger/nvim-lint',
    lazy = false,
    config = function()
        require('lint').linters_by_ft = {
            lua = {'luacheck'},
            bash = {'shellcheck'},
            sh = {'shellcheck'},
            cpp = {'cpplint'},
            json = {'jsonlint'}
        }
    end
}
