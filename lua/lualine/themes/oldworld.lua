local p = require("oldworld.palette")

return {
	normal = {
		a = { fg = p.bg, bg = p.red, gui = "bold" },
		b = { fg = p.fg, bg = p.gray2 },
		c = { fg = p.fg, bg = p.gray1 },
	},
	command = { a = { fg = p.bg, bg = p.yellow, gui = "bold" } },
	insert = { a = { fg = p.bg, bg = p.purple, gui = "bold" } },
	visual = { a = { fg = p.bg, bg = p.magenta, gui = "bold" } },
	terminal = { a = { fg = p.bg, bg = p.green, gui = "bold" } },
	replace = { a = { fg = p.bg, bg = p.orange, gui = "bold" } },
	inactive = {
		a = { fg = p.gray4, bg = p.bg_dark, gui = "bold" },
		b = { fg = p.gray4, bg = p.bg_dark },
		c = { fg = p.gray4, bg = p.bg_dark },
	},
}
