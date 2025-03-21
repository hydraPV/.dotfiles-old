return {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require('tiny-inline-diagnostic').setup({
            preset = "powerline",
            transparent_bg = false
        })
    end,
    vim.diagnostic.config({virtual_text = false})
}
