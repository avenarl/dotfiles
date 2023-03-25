local cmd = vim.cmd

vim.g.mapleader = ' ' -- Set map leader to <space>
vim.g.toggleterm_terminal_mapping = '<C-t>' -- For terminal

-- Navigation within insert mode

map('i', 'jk', '<Esc>') -- Escape
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
map('n', '<C-w', ':bdelete') -- Close the displaying buffer

-- Toggle comments

map('n', '<leader>/', ':CommentToggle <CR>')
map('v', '<leader>/', ':CommentToggle <CR>')

-- Window navigation

map('n', '<C-h>', '<C-w>h') -- Move left
map('n', '<C-h>', '<C-w>l') -- Move right
map('n', '<C-k>', '<C-w>k') -- Move up
map('n', '<C-j>', '<C-w>j') -- Move down

-- Terminal
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', 'kl', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

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

-- Tmux navigation
map('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>') -- Left tmux navigation
map('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>') -- Down tmux navigation
map('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>') -- Up tmux navigation
map('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>') -- Right tmux navigation

-- Change double quote to single quote
map('n', '<leader>s', '[[:%s/"\([^"]*\)"/'\1'/g<CR>]]')


