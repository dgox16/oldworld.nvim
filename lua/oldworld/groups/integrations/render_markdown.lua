local p = require("oldworld.palette")
local u = require("oldworld.utils.color_utils")

local DARKEN_AMOUNT = 0.20

return {
    RenderMarkdownCode = { bg = p.gray1 },
    RenderMarkdownCodeInline = { fg = p.green, bold = true },
    RenderMarkdownBullet = { fg = p.cyan },
    RenderMarkdownH1Bg = { bg = u.darken(p.blue, DARKEN_AMOUNT, p.bg), fg = p.blue },
    RenderMarkdownH2Bg = { bg = u.darken(p.green, DARKEN_AMOUNT, p.bg), fg = p.green },
    RenderMarkdownH3Bg = { bg = u.darken(p.yellow, DARKEN_AMOUNT, p.bg), fg = p.yellow },
    RenderMarkdownH4Bg = { bg = u.darken(p.red, DARKEN_AMOUNT, p.bg), fg = p.red },
    RenderMarkdownH5Bg = { bg = u.darken(p.magenta, DARKEN_AMOUNT, p.bg), fg = p.magenta },
    RenderMarkdownH6Bg = { bg = u.darken(p.purple, DARKEN_AMOUNT, p.bg), fg = p.purple },
    RenderMarkdownH1 = { bg = u.darken(p.blue, DARKEN_AMOUNT, p.bg), fg = p.blue },
    RenderMarkdownH2 = { bg = u.darken(p.green, DARKEN_AMOUNT, p.bg), fg = p.green },
    RenderMarkdownH3 = { bg = u.darken(p.yellow, DARKEN_AMOUNT, p.bg), fg = p.yellow },
    RenderMarkdownH4 = { bg = u.darken(p.red, DARKEN_AMOUNT, p.bg), fg = p.red },
    RenderMarkdownH5 = { bg = u.darken(p.magenta, DARKEN_AMOUNT, p.bg), fg = p.magenta },
    RenderMarkdownH6 = { bg = u.darken(p.purple, DARKEN_AMOUNT, p.bg), fg = p.purple },
    RenderMarkdownTableHead = { fg = p.subtext3 },
    RenderMarkdownTableRow = { fg = p.subtext3 },
}
