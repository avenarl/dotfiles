vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Higlighting Syntax
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
