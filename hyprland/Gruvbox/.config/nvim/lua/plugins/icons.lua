return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        override = {
          folder = {
            icon = "", -- Default folder icon
            color = "#fe8019", -- Change this to your preferred color
            name = "Directory"
          }
        },
        default = true
      })
    end
  }
}

