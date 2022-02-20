vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'rebelot/kanagawa.nvim'

	-- Higlighting Syntax
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Hexcode color identifier
	use { 'norcalli/nvim-colorizer.lua' }

	use { 'nvim-lualine/lualine.nvim', }

end)
