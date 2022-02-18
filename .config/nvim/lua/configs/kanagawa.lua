require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "bold",
    keywordStyle = "italic",
    statementStyle = "NONE",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    colors = {
		sumiInk1 = "#000000", -- background color
		surimiOrange = "#E95420", -- constants, imports, booleans - orange
		sakuraPink = "#DC322F", -- numbers - red
		oniViolet = "#FCC82D", -- statements and keywords
		springGreen = "#727169", -- string - dark grey
		crystalBlue = "#934FFF", -- functions and titles - violet
		springViolet2 = "#DC322F", -- brackets and punctuations
		carpYellow = "#4D83C1", -- identifiers - orange
		boatYellow2 = "#719e07", -- operators and regex
		fujiWhite = "#719E07",
		fujiGray = "#586E75"
	},
    overrides = {},
})

