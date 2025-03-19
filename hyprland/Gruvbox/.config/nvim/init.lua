-- Lazy bootstrap
require("config.lazy")

--      General Settings

-- Disable netrw (built-in file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = ' ' }

-- Set tab distance
vim.opt.tabstop = 4        
vim.opt.shiftwidth = 4    
vim.opt.softtabstop = 4 
vim.opt.expandtab = true


--      Keybinds

-- Set <space> as leader key
vim.g.mapleader = " "  -- Set space as the leader key

-- Disable the leader key alone (makes <leader> a non-functional prefix)
vim.keymap.set('n', '<leader>', '<nop>', { noremap = true, silent = true })

-- Remap P and p
vim.api.nvim_set_keymap('n', 'p', 'P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', 'p', { noremap = true, silent = true })

-- Disable Arrow Keys in Normal, Insert, and Visual Modes
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<NOP>", { desc = "Disable Up Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<NOP>", { desc = "Disable Down Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<NOP>", { desc = "Disable Left Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<NOP>", { desc = "Disable Right Arrow" })

-- Move in Insert Mode with <C-hjkl> (better navigation control)
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })


--      Oil.nvim

-- Open oil.nvim (file explorer)
vim.keymap.set("n", "<leader>o", require("oil").open)



--      Nvim-tree

-- Toggle the Nvim-tree file explorer
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Switch between Nvim-tree and the editor (toggle behavior)
vim.keymap.set('n', '<leader>e', function() 
  local nvim_tree_win_id = vim.fn.bufwinid('NvimTree')
  if nvim_tree_win_id ~= -1 then
    vim.cmd('wincmd p')
  else
    local status_ok, _ = pcall(require('nvim-tree').toggle)
    if not status_ok then
      print("Failed to toggle NvimTree")
    end
  end
end, { noremap = true, silent = true })


--      Bufferline.nvim

-- Close the current buffer (tab)
vim.keymap.set('n', '<leader>w', ':bdelete<CR>', { noremap = true, silent = true })

-- Switch between buffers (1 to 5) using <leader> key
for i = 1, 5 do
  vim.keymap.set('n', '<leader>'..i, function() require'bufferline'.go_to_buffer(i) end, { noremap = true, silent = true })
end


--      Snacks.nvim

-- Search through open buffers using Snacks.nvim
vim.keymap.set('n', "<leader>,", function() Snacks.picker.buffers() end)

-- Open git log
vim.keymap.set('n', "<leader>gl", function() Snacks.picker.git_log() end)

-- Toggle Zen Mode
vim.keymap.set('n', "<leader>z",  function() Snacks.zen() end)

-- Open current git repo in browser
vim.keymap.set('n', "<leader>gz", function() Snacks.gitbrowse() end)

-- Open lazygit
vim.keymap.set('n', "<leader>gg", function() Snacks.lazygit() end)

-- Color scheme selector
vim.keymap.set('n', "<leader>uC", function() Snacks.picker.colorschemes() end)
