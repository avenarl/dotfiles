require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "bold",
    statementStyle = "NONE",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords 
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    colors = {
		sumiInk1 = "#16161D", -- background color
		surimiOrange = "#934FFF", -- constants, imports, booleans
		peachRed= "#934FFF", -- standout specials 2 (exception handling, return)
		fujiWhite = "#934FFF", -- default foreground
		sakuraPink = "#89E051", -- numbers
		springViolet2 = "#89E051", -- brackets and punctuations
		boatYellow2 = "#89E051", -- operators and regex
		oniViolet = "#41B883", -- statements and keywords
		waveRed = "#41B883", -- standout specials 1 (builtin variables)
		springGreen = "#2B7489", -- string 
		crystalBlue = "#FF3E00", -- functions and titles
		carpYellow = "#00ADD8", -- identifiers 
		fujiGray = "#586E75" -- comments
	},
    overrides = {},
})

