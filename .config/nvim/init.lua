require('plugins')
require('utils')
require('mappings')

local opt = vim.opt 

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

-- Colorscheme 

opt.termguicolors = true
