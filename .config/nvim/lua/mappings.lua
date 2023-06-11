local cmd = vim.cmd

vim.g.mapleader = " " -- Set map leader to <space>
vim.g.toggleterm_terminal_mapping = "<C-t>" -- For terminal

-- Navigation within insert mode

map("i", "jk", "<Esc>") -- Escape
map("i", "<C-h>", "<Left>") -- Backward
map("i", "<C-e>", "<End>") -- End-of-line
map("i", "<C-l>", "<Right>") -- Forward
map("i", "<C-k>", "<Up>") -- Next line
map("i", "<C-j>", "<Down>") -- Previous line
map("i", "<C-a>", "<Esc>^i") -- Start of line
-- Buffers in normal mode

map("n", "<C-s>", ":w <CR>") -- Save file using :w
map("n", "<C-a>", ":%y+ <CR>") -- Copy all contents of the current buffer
map("n", "<leader>n", ":set nu! <CR>") -- Toggle numbers
map("n", "<leader>x", ":q <CR>") -- Close buffer
map("n", "<S-t>", ":enew <CR>") -- Open a new buffer
map("n", "<C-t>b", ":tabnew <CR>") -- Open a new vim tab
map("n", "<TAB>", ":BufferLineCycleNext <CR>") -- Next buffer
map("n", "<S-Tab>", ":BufferLineCycleNext <CR>") -- Previous buffer
map("n", "<C-w>", ":bdelete <CR>") -- Close the displaying buffer

-- Delete
map("i", "<C-d>", "<C-o>diw") -- delete a word

-- Toggle Terminal
map("n", "<C-t>", ":terminal<CR>")

-- Toggle comments

map("n", "<leader>/", ":CommentToggle <CR>")
map("v", "<leader>/", ":CommentToggle <CR>")

-- Window navigation

map("n", "<C-h>", "<C-w>h") -- Move left
map("n", "<C-h>", "<C-w>l") -- Move right
map("n", "<C-k>", "<C-w>k") -- Move up
map("n", "<C-j>", "<C-w>j") -- Move down
map("i", "<C-Right>", "<C-p>") -- Move to next word

-- Terminal
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "kl", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Nvim Tree

map("n", "<C-n>", ":NvimTreeToggle <CR>") -- Toggle Tree
map("n", "<leader>r", ":NvimTreeRefresh <CR>") -- Refresh Tree
map("n", "<leader>n", ":NvimTreeFindFile <CR>") -- Find file

-- Telescope

--map("n", "<leader>ff", "<cmd> Telescope find_files <CR>") -- Search File
--map("n", "<leader>fg", "<cmd> Telescope live_grep live_grep <CR>") -- Live Grep
--map("n", "<leader>fb", "<cmd> Telescope buffers <CR>") -- Buffers
--map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>") -- Help tags

-- Fzf
map("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>")

-- Bufferline
vim.cmd([[
	nnoremap <silent>[b :BufferLineCycleNext<CR>
	nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
]])

-- Notetaking (Papyrus)
vim.g.papyrus_latex_engine = "xelatex"
vim.g.papyrus_viewer = "zathura"

-- Tmux navigation
map("n", "<C-h>", ":<C-U>TmuxNavigateLeft<cr>") -- Left tmux navigation
map("n", "<C-j>", ":<C-U>TmuxNavigateDown<cr>") -- Down tmux navigation
map("n", "<C-k>", ":<C-U>TmuxNavigateUp<cr>") -- Up tmux navigation
map("n", "<C-l>", ":<C-U>TmuxNavigateRight<cr>") -- Right tmux navigation

-- Change double quote to single quote
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/'\([^']*\)"/"\1"/g<CR>]], { noremap = true })

-- Java Development

-- key_mapping --
local key_map = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- run debug
function get_test_runner(test_name, debug)
	if debug then
		return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"'
	end
	return 'mvn test -Dtest="' .. test_name .. '"'
end

function run_java_test_method(debug)
	local utils = require("utils")
	local method_name = utils.get_current_full_method_name("\\#")
	vim.cmd("term " .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
	local utils = require("utils")
	local class_name = utils.get_current_full_class_name()
	vim.cmd("term " .. get_test_runner(class_name, debug))
end

function get_spring_boot_runner(profile, debug)
	local debug_param = ""
	if debug then
		debug_param =
			' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
	end

	local profile_param = ""
	if profile then
		profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
	end

	return "mvn spring-boot:run " .. profile_param .. debug_param
end
function run_spring_boot(debug)
	vim.cmd("term " .. get_spring_boot_runner(method_name, debug))
end

vim.keymap.set("n", "<leader>tm", function()
	run_java_test_method()
end)
vim.keymap.set("n", "<leader>TM", function()
	run_java_test_method(true)
end)
vim.keymap.set("n", "<leader>tc", function()
	run_java_test_class()
end)
vim.keymap.set("n", "<leader>TC", function()
	run_java_test_class(true)
end)
vim.keymap.set("n", "<c-r>", function()
	run_spring_boot()
end)
vim.keymap.set("n", "<c-R>", function()
	run_spring_boot(true)
end)

-- setup debug
key_map("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>')
key_map("n", "<leader>B", ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
key_map("n", "<leader>bl", ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
key_map("n", "<leader>dr", ':lua require"dap".repl.open()<CR>')

-- view informations in debug
function show_dap_centered_scopes()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end
key_map("n", "gs", ":lua show_dap_centered_scopes()<CR>")

-- move in debug
key_map("n", "<S-c>", ':lua require"dap".continue()<CR>')
key_map("n", "<S-p>", ':lua require"dap".step_over()<CR>')
key_map("n", "<S-i>", ':lua require"dap".step_into()<CR>')
key_map("n", "<S-o>", ':lua require"dap".step_out()<CR>')

function attach_to_debug()
	local dap = require("dap")
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to the process",
			hostName = "localhost",
			port = "5005",
		},
	}
	dap.continue()
end

key_map("n", "<leader>da", ":lua attach_to_debug()<CR>")
