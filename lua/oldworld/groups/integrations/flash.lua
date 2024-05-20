local p = require("oldworld.palette")

return {
    FlashLabel = { fg = p.bright_green, bg = p.bg, bold = true },
    FlashBackdrop = { fg = p.gray4 },
    FlashMatch = { fg = p.bright_purple, bg = p.bg },
    FlashCurrent = { fg = p.bright_cyan, bg = p.bg },
}
