return {
    event = "BufReadPre",
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
}
