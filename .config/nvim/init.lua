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
require("nvim-tree").setup({})
--require("telescope").setup({})

local opt = vim.opt

vim.cmd("colorscheme kanagawa")

vim.cmd([[ filetype plugin indent on ]])
vim.cmd([[autocmd FileType NvimTree lua ResetNvimTreeColors()]])

function ResetNvimTreeColors()
	vim.cmd([[highlight NvimTreeFolderName guifg=#7FBC4CA]])
	--	vim.cmd([[highlight NvimTreeFolderIcon guifg=#63E76B]])
	vim.cmd([[highlight NvimTreeIndentMarker guifg=white]])
end

-- Disable mouse
opt.mouse = ""

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

-- Apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Search

opt.ignorecase = true -- Ignore case
opt.wildignorecase = true -- Ignore case when completing file names and directories

opt.clipboard:append("unnamedplus")
