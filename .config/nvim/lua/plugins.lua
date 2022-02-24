vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	use 'rebelot/kanagawa.nvim'

	-- Higlighting Syntax
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Hexcode color identifier
	use 'norcalli/nvim-colorizer.lua' 

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Statusline requires Icons
	use { 
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Navigation
	-- File explorer
	use 'kyazdani42/nvim-tree.lua'

	-- Completion
	-- Brackets  
	use 'windwp/nvim-autopairs'
	
	-- Tags
	use 'windwp/nvim-ts-autotag'

	-- LSP Client
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Auto completion plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

end)
