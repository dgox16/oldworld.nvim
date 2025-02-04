local palette = require("oldworld.palette")

return {
	NeogitDiffDeleteHighlight = { bg = palette.dark_orange, fg = palette.brightest_orange },
	NeogitDiffDelete = { bg = palette.dark_orange, fg = palette.orange },
	NeogitDiffDeleteCursor = { bg = palette.brightest_orange, fg = palette.dark_orange },

	NeogitDiffAddHighlight = { bg = palette.dark_green, fg = palette.brightest_green },
	NeogitDiffAdd = { bg = palette.dark_green, fg = palette.green },
	NeogitDiffAddCursor = { bg = palette.brightest_green, fg = palette.dark_green },

	NeogitDiffContextHighlight = { bg = palette.gray2 },
	NeogitDiffContext = { bg = palette.bg },
}
