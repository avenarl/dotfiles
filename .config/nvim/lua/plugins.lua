-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  -- Colorscheme
  use { "rebelot/kanagawa.nvim" }
  use { "navarasu/onedark.nvim" }
  use { "folke/tokyonight.nvim" }
  use { "safv12/andromeda.vim" }
  use { "catppuccin/catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }

  -- Markdown
  use {
    "MeanderingProgrammer/markdown.nvim",
    after = { "nvim-treesitter" }, -- Mandatory
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional but recommended
    config = function()
      require("render-markdown").setup {}
    end,
  }

  use {
    "tadmccorkle/markdown.nvim",
    config = function()
      require("markdown").setup {
        -- configuration here or empty for defaults
      }
    end,
  }

  -- Whitespaces
  use { "lukoshkin/highlight-whitespace" }
  use { "johnfrankmorgan/whitespace.nvim" }
  use { "cappyzawa/trim.nvim" }
  use { "mcauley-penney/tidy.nvim" }

  -- Higlighting Syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/nvim-treesitter-refactor" }

  -- Hexcode color identifier
  use { "norcalli/nvim-colorizer.lua" }

  -- Icons
  use { "kyazdani42/nvim-web-devicons" }

  -- File finder
  use { "ibhagwan/fzf-lua" }

  -- Statusline dependencies Icons
  use {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  }

  -- Navigation
  use { "kyazdani42/nvim-tree.lua" }

  -- Auto Completion
  use { "hrsh7th/nvim-cmp" } -- completion plugin
  use { "hrsh7th/cmp-buffer" } -- source for text in buffer
  use { "hrsh7th/cmp-path" } -- source for file system paths

  -- snippets
  use { "L3MON4D3/LuaSnip" } -- snippet engine
  use { "saadparwaiz1/cmp_luasnip" } -- for autocompletion
  use { "rafamadriz/friendly-snippets" } -- ful snippets

  -- Brackets
  use { "windwp/nvim-autopairs" }

  -- Tags
  use { "windwp/nvim-ts-autotag" }

  -- Managing and installing lsp servers
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- LSP servers configuration
  use { "neovim/nvim-lspconfig" } -- language servers
  use { "hrsh7th/cmp-nvim-lsp" } -- autocompletion
  use { "glepnir/lspsaga.nvim", branch = "main" } -- lsp uis
  use { "jose-elias-alvarez/typescript.nvim" } -- typescript functionality
  use { "onsails/lspkind.nvim" } -- vs-code like icons for autocompletion

  -- formatting & linting
  use { "jose-elias-alvarez/null-ls.nvim" } -- configure formatters & linters
  use { "jayp0521/mason-null-ls.nvim" } -- bridges gap b/w mason & null-ls

  -- Buffer
  use {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  }

  -- Notetaking
  use { "abeleinin/papyrus" }
  use { "vim-pandoc/vim-pandoc-syntax" }

  -- Git stuff
  use { "nvim-lua/plenary.nvim" }
  use { "lewis6991/gitsigns.nvim", dependencies = "nvim-lua/plenary.nvim" }

  -- Idention
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Terminal
  use { "akinsho/toggleterm.nvim" }

  -- tmux & split window Navigation
  use { "christoomey/vim-tmux-navigator" }

  -- Syntax highlighting
  use { "sheerun/vim-polyglot" }

  -- Svelte syntax and indention
  use { "evanleck/vim-svelte" }
  use { "mhartington/formatter.nvim" }
  use { "MunifTanjim/prettier.nvim" }

  -- Java
  use { "mfussenegger/nvim-jdtls" }
  use { "mfussenegger/nvim-dap" } -- Debugging
  use { "rcarriga/cmp-dap" }
  use { "williamboman/nvim-lsp-installer" }

  -- SQL
  use { "nanotee/sqls.nvim" }

  -- Bundle all the 'boilerplate code'
  use { "VonHeikemen/lsp-zero.nvim" }
end)
