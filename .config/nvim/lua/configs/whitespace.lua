require("highlight-whitespace").setup({
	tws = "\\s\\+$",
	clear_on_winleave = false,
	user_palette = {
		markdown = {
			jtws = "RosyBrown",
			["\\(\\S\\)\\@<=\\s\\(\\.\\|,\\)\\@="] = "CadetBlue3",
			["\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@="] = "SkyBlue1",
			["\\t\\+"] = "plum4",
		},
		other = {
			tws = "PaleVioletRed",
			["\\(\\S\\)\\@<=\\s\\(,\\)\\@="] = "coral1",
			["\\(\\S\\)\\@<= \\{2,\\}\\(\\S\\)\\@="] = "LightGoldenrod3",
			["\\t\\+"] = "plum4",
		},
	},
})
