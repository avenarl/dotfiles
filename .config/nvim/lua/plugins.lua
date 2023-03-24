vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	use 'rebelot/kanagawa.nvim'

	-- Higlighting Syntax
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-refactor'

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
	use 'nvim-telescope/telescope.nvim'

	-- Completion
	-- Brackets  
	use 'windwp/nvim-autopairs'
	
	-- Tags
	use 'windwp/nvim-ts-autotag'

    -- Mason 
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	-- Buffer
	use {
		'akinsho/bufferline.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Git stuff
	use 'nvim-lua/plenary.nvim'
	use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
	
	-- Idention
	use 'lukas-reineke/indent-blankline.nvim'

	-- Terminal
	use 'akinsho/toggleterm.nvim'

	-- tmux & split window Navigation
	use 'christoomey/vim-tmux-navigator'

	-- Syntax highlighting
	use 'sheerun/vim-polyglot'

	-- Java development plugin
    use 'artur-shaik/vim-javacomplete2'

	  -- Java testing plugin
  	use 'vim-test/vim-test'


end)
