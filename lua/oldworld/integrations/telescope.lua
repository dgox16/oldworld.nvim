local p = require("oldworld.palette")

return {
    TelescopeBorder = { fg = p.bg, bg = p.bg },
    TelescopeNormal = { fg = p.fg, bg = p.bg },
    TelescopePreviewTitle = { fg = p.bright_cyan, bg = p.gray3, italic = true },
    TelescopeResultsTitle = { fg = p.bright_red, bg = p.gray3, italic = true },
    TelescopePromptTitle = { fg = p.fg, bg = p.gray3, italic = true },
    TelescopePromptBorder = { fg = p.gray3, bg = p.bg },
    TelescopePromptNormal = { fg = p.fg, bg = p.bg },
    TelescopePromptCounter = { fg = p.gray4, bg = p.gray1 },
    TelescopeMatching = { fg = p.yellow, bold = true },
}
