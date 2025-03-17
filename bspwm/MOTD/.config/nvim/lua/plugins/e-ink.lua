return {
    "alexxGmZ/e-ink.nvim",
    priority = 1000,
    config = function()

        require("e-ink").setup()
        vim.cmd.colorscheme "e-ink"
        local set_hl = vim.api.nvim_set_hl
        local mono = require("e-ink.palette").mono()
        set_hl(0, "Normal", { fg = mono[12], bg = "NONE" })

    end
}
