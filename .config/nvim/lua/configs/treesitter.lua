require'nvim-treesitter.configs'.setup {
  ensure_installed = {
		'css',
		'html',
		'javascript',
		'lua',
		'scss',
		'svelte',
		'typescript'
	},

  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}
