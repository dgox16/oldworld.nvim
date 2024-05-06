local p = require("oldworld.palette")

return {
    MasonHeader = { fg = p.fg, bg = p.bg, bold = true },
    MasonHeaderSecondary = { fg = p.fg, bg = p.bg, bold = true },
    MasonHighlight = { fg = p.green },
    MasonHighlightBlockBold = { bg = p.fg, fg = p.bg, bold = true },
    MasonHighlightSecondary = { fg = p.blue },
    MasonMuted = { fg = p.subtext4 },
}
