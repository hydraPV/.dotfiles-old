return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'nord',
        },
        
        sections = {
          lualine_a = {
            function()
              local mode_icons = {
                n = '', 
                i = '',
                v = '',
                V = '✂',
                c = '',
              }
              return mode_icons[vim.fn.mode()] or ''
            end,
          },
          lualine_b = {'branch', 'diagnostics'},
          lualine_c = {'filename', require'nvim-web-devicons'.get_icon},
          lualine_x = {'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'},
        },
      })
    end
  }
}

