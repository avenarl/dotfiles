vim.g.mapleader = " " -- Set map leader to <space>

local plugins = {

  -- Colorscheme
  { "folke/tokyonight.nvim" },

  -- Whitespaces
  { "lukoshkin/highlight-whitespace" },
  { "johnfrankmorgan/whitespace.nvim" },
  { "cappyzawa/trim.nvim" },
  { "mcauley-penney/tidy.nvim" },

  -- Higlighting Syntax
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-refactor" },

  -- Hexcode color identifier
  { "norcalli/nvim-colorizer.lua" },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- File finder
  { "ibhagwan/fzf-lua" },

  -- Statusline dependencies Icons
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
  },

  -- Navigation
  { "kyazdani42/nvim-tree.lua" },

  -- Auto Completion
  { "hrsh7th/nvim-cmp" }, -- completion plugin
  { "hrsh7th/cmp-buffer" }, -- source for text in buffer
  { "hrsh7th/cmp-path" }, -- source for file system paths

  -- snippets
  { "L3MON4D3/LuaSnip" }, -- snippet engine
  { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
  { "rafamadriz/friendly-snippets" }, -- ful snippets

  -- Brackets
  { "windwp/nvim-autopairs" },

  -- Tags
  { "windwp/nvim-ts-autotag" },

  -- Managing and installing lsp servers
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP servers configuration
  { "neovim/nvim-lspconfig" }, -- language servers
  { "hrsh7th/cmp-nvim-lsp" }, -- autocompletion
  { "glepnir/lspsaga.nvim", branch = "main" }, -- lsp uis
  { "jose-elias-alvarez/typescript.nvim" }, -- typescript functionality
  { "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

  -- formatting & linting
  { "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
  { "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

  -- Buffer
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  -- Notetaking
  { "abeleinin/papyrus" },
  { "vim-pandoc/vim-pandoc-syntax" },

  -- Git stuff
  { "nvim-lua/plenary.nvim" },
  { "lewis6991/gitsigns.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- Idention
  { "lukas-reineke/indent-blankline.nvim" },

  -- Terminal
  { "akinsho/toggleterm.nvim" },

  -- tmux & split window Navigation
  { "christoomey/vim-tmux-navigator" },

  -- Syntax highlighting
  { "sheerun/vim-polyglot" },

  -- Java
  { "mfussenegger/nvim-jdtls" },
  { "mfussenegger/nvim-dap" }, -- Debugging
  { "rcarriga/cmp-dap" },
  { "williamboman/nvim-lsp-installer" },

  -- Bundle all the 'boilerplate code'
  { "VonHeikemen/lsp-zero.nvim" },
}

require("lazy").setup(plugins, {})
