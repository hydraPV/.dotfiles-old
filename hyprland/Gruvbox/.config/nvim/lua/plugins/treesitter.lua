return {

    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", 
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all", 
        highlight = {
          enable = true, 
          additional_vim_regex_highlighting = true,
        },
      }
    end
  
  }

