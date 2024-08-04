require "plugins"
require "utils"
require "mappings"
require "options"
require "configs.treesitter"
require "configs.kanagawa"
require "configs.lualine"
require "configs.nvim-tree"
require "configs.autopairs"
require "configs.autotags"
require "configs.bufferline"
require "configs.nvim-cmp"
require "configs.lsp.mason"
require "configs.lsp.lsp-config"
require "configs.lsp.lspsaga"
require "configs.lsp.null-ls"
require "configs.gitsigns"
require "configs.formatter"
require "configs.nvim-dap"
require "configs.lsp.nvim-lsp-installer"
require "configs.whitespace"
require "configs.trim"
--require "configs.markdown"
require("nvim-ts-autotag").setup()
require("nvim-tree").setup {}
