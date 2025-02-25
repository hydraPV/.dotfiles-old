return {
    "ap/vim-buftabline",
    config = function()
        vim.g.buftabline_numbers = 2   -- Show buffer numbers
        vim.g.buftabline_indicators = 1 -- Show unsaved changes indicator
        vim.g.buftabline_show = 1       -- Always show the tabline
    end,
}

