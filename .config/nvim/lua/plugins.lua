vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("rebelot/kanagawa.nvim")
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")
	use("catppuccin/catppuccin")
	use("ellisonleao/gruvbox.nvim")

	-- Higlighting Syntax
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- Hexcode color identifier
	use("norcalli/nvim-colorizer.lua")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Statusline requires Icons
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Navigation
	-- File explorer
	use("kyazdani42/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")

	-- Auto Completion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- Brackets
	use("windwp/nvim-autopairs")

	-- Tags
	use("windwp/nvim-ts-autotag")

	-- Managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- LSP servers configuration
	use("neovim/nvim-lspconfig") -- language servers
	use("hrsh7th/cmp-nvim-lsp") -- autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- typescript functionality
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Buffer
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Git stuff
	use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Idention
	use("lukas-reineke/indent-blankline.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- tmux & split window Navigation
	use("christoomey/vim-tmux-navigator")

	-- Syntax highlighting
	use("sheerun/vim-polyglot")

	-- Java development plugin
	use("artur-shaik/vim-javacomplete2")

	-- Svelte syntax and indention
	use("evanleck/vim-svelte")
	use("mhartington/formatter.nvim")

	-- Java testing plugin
	use("vim-test/vim-test")
	-- Java
	use("mfussenegger/nvim-jdtls")
end)
