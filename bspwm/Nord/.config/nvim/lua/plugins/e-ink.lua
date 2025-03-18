return {
    "shaunsingh/nord.nvim",
    lazy = false, 
    priority = 1000,
    config = function()
        nord_contrast = true
        vim.g.nord_disable_background = true
        nord_cursorline_transparent = true
        vim.cmd("colorscheme nord")
    end,

}

