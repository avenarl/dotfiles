require("plugins")
require("utils")
require("mappings")
require("configs.treesitter")
require("configs.kanagawa")
require("configs.lualine")
require("configs.nvim-tree")
require("configs.autopairs")
require("configs.autotags")
require("configs.bufferline")
require("configs.nvim-cmp")
require("configs.nvim-dap")
require("configs.lsp.mason")
require("configs.lsp.lsp-config")
require("configs.lsp.lspsaga")
require("configs.lsp.null-ls")
require("configs.gitsigns")
require("configs.formatter")
require("configs.nvim-dap")
require("configs.lsp.nvim-lsp-installer")
require("configs.prettier")
require("autocommands")
require("nvim-tree").setup({})
--require("telescope").setup({})

local opt = vim.opt

vim.cmd("colorscheme kanagawa")

-- Disable mouse
opt.mouse = ""

-- Windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

--Displays

opt.number = true -- Set number
opt.relativenumber = true -- Set relative number
opt.cursorline = true
opt.lazyredraw = true
opt.hidden = true
opt.linebreak = true

-- Identions
opt.expandtab = true -- Use softtabstop spaces instead of tab characters for indentation
opt.shiftwidth = 2 -- Indent by 4 spaces when using >>, <<, == etc.
opt.softtabstop = 2 -- Indent by 4 spaces when pressing <TAB>

opt.autoindent = true -- Keep indentation from previous line
opt.smartindent = true -- Automatically inserts indentation in some cases
opt.cindent = true -- Like smartindent, but stricter and more customisable

-- Backups

opt.swapfile = false

-- Apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Search

opt.ignorecase = true -- Ignore case
opt.wildignorecase = true -- Ignore case when completing file names and directories
opt.smartcase = true -- Smart case

opt.clipboard:append("unnamedplus")
opt.shortmess:append("c") -- Hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
