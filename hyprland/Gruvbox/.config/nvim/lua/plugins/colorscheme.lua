return {
    "ellisonleao/gruvbox.nvim", 
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        terminal_colors = true,
        transparent_mode = true,
        contrast = "hard",
        palette_overrides = {
          bright_green = "#fbf1c7",
        }
      })
      vim.cmd('colorscheme gruvbox')  -- Apply the colorscheme
    end
}
