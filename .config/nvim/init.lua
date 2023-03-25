require('plugins')
require('utils')
require('mappings')
require('configs.treesitter')
require('configs.kanagawa')
require('configs.lualine')
require('configs.nvim-tree')
require('configs.autopairs')
require('configs.autotags')
require('configs.bufferline')
require('configs.nvim-cmp')
require'nvim-tree'.setup{}

local opt = vim.opt 
vim.cmd('colorscheme kanagawa')
vim.g['test#java#runner'] = 'gradle'

-- Disable mouse
opt.mouse = ''

--Displays

opt.number = true -- Set number
opt.relativenumber = true -- Set relative number
opt.cursorline = true 
opt.lazyredraw = true
opt.hidden = true

-- Identions

opt.smartindent = true -- Insert indents automatically
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for

-- Backups

opt.swapfile = false

-- Search

opt.ignorecase = true -- Ignore case
opt.wildignorecase = true -- Ignore case when completing file names and directories

vim.opt.termguicolors = true
