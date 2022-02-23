require('cmp').setup({
	 snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	}
	
}) 
