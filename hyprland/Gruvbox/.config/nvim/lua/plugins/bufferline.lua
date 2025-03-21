return {
    {
        'akinsho/bufferline.nvim',
        event = "BufReadPre",
        config = function()
            require("bufferline").setup {
                options = {
                    numbers = "ordinal",
                    indicator = {style = "icon", icon = "▎"},
                    buffer_close_icon = " ",
                    modified_icon = "●",
                    close_icon = " ",
                    separator_style = "thin",
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_tab_indicators = true,
                    persist_buffer_sort = true,
                    enforce_regular_tabs = true,
                    always_show_bufferline = true
                }
            }
        end
    }
}

