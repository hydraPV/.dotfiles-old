return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP completion
    "hrsh7th/cmp-buffer",    -- Buffer completion
    "hrsh7th/cmp-path",      -- Path completion
    "hrsh7th/cmp-cmdline",   -- Command-line completion
    "L3MON4D3/LuaSnip",      -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completion
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- Enable snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab to select next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab to select previous
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP suggestions
        { name = "buffer" },   -- Text buffer suggestions
        { name = "path" },     -- File path suggestions
        { name = "luasnip" },  -- Snippet suggestions
      }),
    })
  end,
}

