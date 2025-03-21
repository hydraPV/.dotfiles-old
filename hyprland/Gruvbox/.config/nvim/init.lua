-------------------------------------------------
-- Bootstrap lazy.nvim
require("config.lazy")

-------------------------------------------------
-- General configuration

-- Disable netrw (Built in explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Adds a background to the line in which the cursor is
vim.opt.cursorline = true

-- Remove these ~ on empty lines
vim.opt.fillchars = {eob = ' '}

-- Set <tab> space
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-------------------------------------------------
-- General keymaps / Variables

-- Variables
local map = vim.keymap.set
local built = require('telescope.builtin')
local hidden = ({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })
local grep = { additional_args = function() return { "--hidden", "-g", "!.git" } end }
local opt = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " " -- Sets 'space' as leader key
map('n', '<leader>', '<nop>', opt) -- Disables space key in normal mode

-------------------------------------------------
-- Movement keys

-- Disables arrow keys
map({"n", "i", "v"}, "<Up>", "<NOP>")
map({"n", "i", "v"}, "<Down>", "<NOP>")
map({"n", "i", "v"}, "<Left>", "<NOP>")
map({"n", "i", "v"}, "<Right>", "<NOP>")

-- Move in insert mode with <C-hjkl>
map('i', '<C-h>', '<Left>', opt)
map('i', '<C-j>', '<Down>', opt)
map('i', '<C-k>', '<Up>', opt)
map('i', '<C-l>', '<Right>', opt)


-------------------------------------------------
-- Shortcuts

-- Faster yanking/pasting
map('n', '<leader>y', '"+y', opt)
map('v', '<leader>y', '"+y', opt)
map('n', '<leader>p', '"+p', opt)
map('v', '<leader>p', '"+p', opt)

-- Swap Paste behavior
map('n', 'p', 'P', opt)
map('n', 'P', 'p', opt)

-- Save file 
map('n', '<C-s>', ':w<CR>', opt)

-- Clear search highlightning
map('n', '<leader>nh', ':noh<CR>', opt)
------------------------------------------------
-- Plugin maps

-- Telescope
map('n', '<leader>fh', "<cmd>Telescope help_tags<CR>") -- Search help pages
map('n', '<leader>fb', "<cmd>Telescope keymaps<CR>", opt) -- View all keybindings
map('n', '<leader>ff', function() built.find_files(hidden) end, opt) -- Fuzzy find current directory
map('n', '<leader>fg', function() built.live_grep(grep) end, opt) -- Grep files 
map('n', '<leader>fr', built.oldfiles) -- Search old files
map('n', '<leader>fc', function() built.find_files {cwd = vim.fn.stdpath 'config'} end) -- Find files on nvim config


-- Explorers
map('n', '<leader>o', function() require("mini.files").open(vim.uv.cwd(), true) end) -- Open mini.files
map('n', '<leader>n', ':NvimTreeToggle<CR>', opt) -- open NvimTree.nvim


-- Bufferline
map('n', '<leader>w', ':bdelete<CR>', opt) -- Close the current buffer
for i = 1, 9 do
  map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { noremap = true, silent = true }) -- Move between buffers
end


-- Conform.nvim
map('n', '<leader>f','<cmd>lua require("conform").format()<CR>',opt) -- Apply formatting


-- Snacks.nvim
map('n', "<leader>gl", function() Snacks.picker.git_log() end) -- Open git log
map('n', "<leader>z", function() Snacks.zen() end) -- Toggle zen mode
map('n', "<leader>gb", function() Snacks.gitbrowse() end) -- Open git repo on a browser
map('n', "<leader>gg", function() Snacks.lazygit() end) -- Open lazygit

-------------------------------------------------
-- Autocommands

-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
