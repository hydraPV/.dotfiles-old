-- Lazy.nvim
require("config.lazy")

-- General config
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = ' ' }

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Tab
vim.opt.tabstop = 2        
vim.opt.shiftwidth = 2    
vim.opt.softtabstop = 2 
vim.opt.expandtab = true


-- Oil.nvim
vim.keymap.set("n", "<leader>o", require("oil").open) -- Open Oil.nvim

-- Nvim-tree.nvim
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open/close Nvim-tree.nvim

vim.keymap.set('n', '<leader>e', function()
  local nvim_tree_win_id = vim.fn.bufwinid('NvimTree')
  if nvim_tree_win_id ~= -1 then
    -- If NvimTree is already open, focus it
    vim.cmd('wincmd p')
  else
    -- Otherwise, open NvimTree without showing errors if it fails
    local status_ok, _ = pcall(require('nvim-tree').toggle)
    if not status_ok then
      print("Failed to toggle NvimTree")
    end
  end
end, { noremap = true, silent = true })


-- Bufferline.nvim
vim.keymap.set('n', '<leader>w', ':bdelete<CR>', { noremap = true, silent = true }) -- Close the current tab

vim.keymap.set('n', '<leader>1', function() require'bufferline'.go_to_buffer(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', function() require'bufferline'.go_to_buffer(2) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', function() require'bufferline'.go_to_buffer(3) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', function() require'bufferline'.go_to_buffer(4) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', function() require'bufferline'.go_to_buffer(5) end, { noremap = true, silent = true })

-- Bind to block arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<NOP>", { desc = "Disable Up Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<NOP>", { desc = "Disable Down Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<NOP>", { desc = "Disable Left Arrow" })
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<NOP>", { desc = "Disable Right Arrow" })
vim.keymap.set('n', '<leader>', '<nop>', { noremap = true, silent = true })


-- Bind <C-hjkl> to move in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })  
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })  
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })


