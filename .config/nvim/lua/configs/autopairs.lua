require('nvim-autopairs').setup({
	disable_filetype = {"TelescopePrompt", "vim"},
	fast_wrap = {
		chars = {'{', '[', '(', '"', "'"},
		check_comma = true,
		end_key = '$',
		highlight = 'Search',
		keys = 'qwertuiopzxcvbnmasdfghjkl',
		map = '<M-e>',
		offset = 0, -- Offset from pattern match
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', '')
	}
})
