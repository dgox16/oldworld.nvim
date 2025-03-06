local p = require("oldworld.palette")
local u = require("oldworld.utils.color_utils")

return {
    SnacksIndent = { fg = p.gray3 },
    SnacksIndentScope = { fg = p.subtext4 },
    SnacksDashboardHeader = { fg = p.purple },
    SnacksDashboardDesc = { fg = p.subtext1 },
    SnacksDashboardKey = { fg = p.magenta, bold = true },
    SnacksDashboardIcon = { fg = p.subtext1 },
    SnacksDashboardFooter = { fg = p.purple, italic = true },
    SnacksDashboardSpecial = { fg = u.lighten(p.purple, 0.5, p.fg), bold = true, italic = true },
}
