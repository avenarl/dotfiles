require('cmp').setup({
	snippet = {
		expand = function(args)
		require('luasnip').lsp_expand(args.body)
		end,
  },
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
  },	
}) 
