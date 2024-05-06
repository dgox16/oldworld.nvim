local p = require("oldworld.palette")

return {
    TelescopeBorder = { fg = p.bg, bg = p.bg },
    TelescopeNormal = { fg = p.fg, bg = p.bg },
    TelescopePreviewTitle = { fg = p.black, bg = p.cyan, bold = true },
    TelescopeResultsTitle = { fg = p.bg, bg = p.bg },
    TelescopePromptTitle = { fg = p.black, bg = p.red, bold = true },
    TelescopePromptBorder = { fg = p.gray1, bg = p.gray1 },
    TelescopePromptNormal = { fg = p.fg, bg = p.gray1 },
    TelescopePromptCounter = { fg = p.gray4, bg = p.gray1 },
    TelescopeMatching = { fg = p.yellow, underline = true },
}
