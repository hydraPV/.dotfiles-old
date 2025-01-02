return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Automatically run :TSUpdate after installation
        config = function()
            require("nvim-treesitter.configs").setup({
                -- List of parsers to install
                ensure_installed = { "lua", "python", "javascript", "html", "css", "c", "cpp", "rust" },
                sync_install = false,   -- Install parsers synchronously (only applied to `ensure_installed`)
                auto_install = true,    -- Automatically install missing parsers
                highlight = {
                    enable = true,      -- Enable highlighting
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,      -- Enable indentation
                },
            })
        end,
    },
}

