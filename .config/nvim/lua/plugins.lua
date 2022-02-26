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

	-- Autocompletion
	use 'hrsh7th/cmp-nvim-lua' -- Lua completion
	use 'hrsh7th/cmp-nvim-lsp' -- Easy auto import
	use 'hrsh7th/cmp-buffer' -- Completes words from the current buffer
	use 'hrsh7th/cmp-path' -- Helps to complete files
	use 'hrsh7th/cmp-cmdline' -- Command LIne 
	use 'hrsh7th/nvim-cmp' -- Core engine completion
	use 'onsails/lspkind-nvim' -- LSP

	-- Luasnip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

end)
