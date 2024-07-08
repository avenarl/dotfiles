vim.cmd "colorscheme gruvbox"

-- Disable mouse
vim.opt.mouse = ""

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Windows
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.autowrite = true -- Automatically save before :next, :make etc.
vim.opt.autochdir = true -- Change CWD when user open a file

--Displays

vim.opt.number = true -- Set number
vim.opt.relativenumber = true -- Set relative number
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.linebreak = true

-- Identions
vim.opt.expandtab = true -- Use softtabstop spaces instead of tab characters for indentation
vim.opt.shiftwidth = 2 -- Indent by 4 spaces when using >>, <<, == etc.
vim.opt.tabstop = 2 -- 1 tab == 2 spaces
vim.opt.smartindent = true -- AUtoindent new lines

vim.opt.autoindent = true -- Keep indentation from previous line
vim.opt.smartindent = true -- Automatically inserts indentation in some cases
vim.opt.cindent = true -- Like smartindent, but stricter and more customisable

-- Backups

vim.opt.swapfile = false -- Don't use swapfile

-- Apperance
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "125"

-- Search

vim.opt.ignorecase = true -- Ignore case
vim.opt.wildignorecase = true -- Ignore case when completing file names and directories
vim.opt.smartcase = true -- Smart case

vim.opt.clipboard:append "unnamedplus" -- Copy/paste to system clipboard
vim.opt.shortmess:append "c" -- Hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.formatoptions:remove { "c", "r", "o" } -- This is a sequence of letters which describes how automatic formatting is to be done

function _G.strip_trailing_whitespace()
  vim.cmd [[%s/\s\+$//e]]
end

vim.cmd [[
  autocmd BufWritePre * lua strip_trailing_whitespace()
]]
