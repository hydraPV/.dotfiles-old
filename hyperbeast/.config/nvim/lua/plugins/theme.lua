return {
    -- Other plugins...
  
    {
      "olivercederborg/poimandres.nvim",
      lazy = false, -- Ensure the theme is loaded immediately or change as per preference
      priority = 1000, -- Give it high priority to ensure it's loaded first
      config = function()
        require("poimandres").setup({

        disable_background = true, 
        })
        vim.cmd("colorscheme poimandres")
      end,
    },
  
    -- Other plugins...
  }
  