require("kanagawa").setup({
	compile = false,
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { bold = false },
	keywordStyle = { bold = false },
	statementStyle = { bold = false },
	typeStyle = {},
	variablebuiltinStyle = "italic",
	transparent = false,
	dimInactive = false,
	terminalColors = true,
	colors = { -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
})
