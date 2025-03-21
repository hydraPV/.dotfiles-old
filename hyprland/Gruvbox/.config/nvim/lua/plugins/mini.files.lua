return {
    'echasnovski/mini.files',
    version = false,

    config = function()
        require("mini.files").setup({

            windows = {
                max_number = math.huge,
                preview = true,
                width_focus = 100,
                width_nofocus = 100,
                width_preview = 60
            },

            options = {permanent_delete = true, use_as_default_explorer = true}

        })
    end
}

