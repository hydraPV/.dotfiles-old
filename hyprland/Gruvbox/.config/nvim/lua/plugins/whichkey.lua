return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({
            preset = "helix", -- Set the preset to "helix" for the helix style
            plugins = {
                marks = true,
                registers = true,
                spelling = {enabled = true, suggestions = 35}
            },
            layout = {
                height = {min = 60, max = 70},
                width = {min = 60, max = 70}
            }
        })
    end
}

