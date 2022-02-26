local cmd = vim.cmd

vim.g.mapleader = ' ' -- Set map leader to <space>

-- Navigation within insert mode

map('i', '<C-h>', '<Left>') -- Backward
map('i', '<C-e>', '<End>') -- End-of-line
map('i', '<C-l>', '<Right>') -- Forward
map('i', '<C-k>', '<Up>') -- Next line
map('i', '<C-j>', '<Down>') -- Previous line
map('i', '<C-a>', '<ESC>^i') -- Beginning of line

-- Buffers in normal mode

map('n', '<C-s>', ':w <CR>') -- Save file using :w
map('n', '<C-a>', ':%y+ <CR>') -- Copy all contents of the current buffer
map('n', '<leader>n', ':set nu! <CR>') -- Toggle numbers
map('n', '<leader>x', ':q <CR>') -- Close buffer
map('n', '<S-t>', ':enew <CR>') -- Open a new buffer
map('n', '<C-t>b', ':tabnew <CR>') -- Open a new vim tab
map('n', '<TAB>', ':BufferLineCycleNext <CR>') -- Next buffer
map('n', '<S-Tab>', ':BufferLineCycleNext <CR>') -- Previous buffer

-- Toggle comments

map('n', '<leader>/', ':CommentToggle <CR>')
map('v', '<leader>/', ':CommentToggle <CR>')

-- Window navigation

map('n', '<C-h>', '<C-w>h') -- Move left
map('n', '<C-h>', '<C-w>l') -- Move right
map('n', '<C-k>', '<C-w>k') -- Move up
map('n', '<C-j>', '<C-w>j') -- Move down

-- Terminal

local silent = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua terminal:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>2', ':lua terminal:open(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>3', ':lua terminal:open(3)<cr>', silent)
map('t', '<ESC>', '<C-\\><C-n> <CR>') -- Escape mode
map('i', 'jk', '<ESC>') -- Escape insert mode

-- Nvim Tree

map('n', '<C-n>', ':NvimTreeToggle <CR>') -- Toggle Tree
map('n', '<leader>r', ':NvimTreeRefresh <CR>') -- Refresh Tree
map('n', '<leader>n', ':NvimTreeFindFile <CR>') -- Find file

-- Telescope

map('n', '<leader>ff', '<cmd> Telescope find_files <CR>') -- Search File
map('n', '<leader>fg', '<cmd> Telescope live_grep live_grep <CR>') -- Live Grep
map('n', '<leader>fb', '<cmd> Telescope buffers <CR>') -- Buffers
map('n', '<leader>fh', '<cmd> Telescope help_tags <CR>') -- Help tags

-- Bufferline 
vim.cmd[[
	nnoremap <silent>[b :BufferLineCycleNext<CR>
	nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
]]
