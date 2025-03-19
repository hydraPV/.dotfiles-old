return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        filters = {
            enable = true,
            dotfiles = true,
        },

        view = {
            number = false,
            side = "right",
            width = 40,
        },
       
      })
    end
  }
}

