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

	-- File explorer
	use 'kyazdani42/nvim-tree.lua'

	-- Brackets  
	use 'windwp/nvim-autopairs'

end)
