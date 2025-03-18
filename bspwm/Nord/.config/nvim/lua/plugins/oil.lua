return {
    {
        "stevearc/oil.nvim",
        config = function()
        require("oil").setup({
        
        columns = {
                "icon",
        },
        
        view_options = {
            line_numbers = false, 
            show_hidden = true,
        },

        float = {
            padding = 2,      
            border = "rounded",
            max_width = 80,
            max_height = 20,
        } ,

        })
     
        vim.cmd("highlight! OilDirectory guifg=#fe8019")  -- Change Oil.nvim folder color
        end
      }
    }


