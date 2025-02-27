local palette = require("oldworld.palette")

local u = require("oldworld.utils.color_utils")

local DARKEN_AMOUNT = 0.20

return {
    NeogitDiffDeleteHighlight = { bg = u.darken(palette.orange, DARKEN_AMOUNT, palette.bg), fg = palette.orange },
    NeogitDiffDelete = { bg = u.darken(palette.orange, DARKEN_AMOUNT, palette.bg), fg = palette.orange },
    NeogitDiffDeleteCursor = { bg = palette.orange, fg = u.darken(palette.orange, DARKEN_AMOUNT, palette.bg) },

    NeogitDiffAddHighlight = { bg = u.darken(palette.green, DARKEN_AMOUNT, palette.bg), fg = palette.green },
    NeogitDiffAdd = { bg = u.darken(palette.green, DARKEN_AMOUNT, palette.bg), fg = palette.green },
    NeogitDiffAddCursor = { bg = palette.green, fg = u.darken(palette.green, DARKEN_AMOUNT, palette.bg) },

    NeogitDiffContextHighlight = { bg = palette.gray2 },
    NeogitDiffContext = { bg = palette.bg },

    NeogitHunkHeaderHighlight = { bg = palette.gray4, fg = palette.fg },
    NeogitHunkHeader = { bg = palette.gray2, fg = palette.fg },
    NeogitHunkHeaderCursor = { bg = palette.gray4, fg = palette.fg },

    NeogitCommitViewHeader = { bg = u.darken(palette.blue, DARKEN_AMOUNT, palette.bg), fg = palette.blue },
}
