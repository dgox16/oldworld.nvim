local palette = require("oldworld.palette")

return {
    NeogitDiffDeleteHighlight = { bg = palette.dark_orange, fg = palette.bright_orange },
    NeogitDiffDelete = { bg = palette.dark_orange, fg = palette.orange },
    NeogitDiffDeleteCursor = { bg = palette.bright_orange, fg = palette.dark_orange },

    NeogitDiffAddHighlight = { bg = palette.dark_green, fg = palette.bright_green },
    NeogitDiffAdd = { bg = palette.dark_green, fg = palette.green },
    NeogitDiffAddCursor = { bg = palette.bright_green, fg = palette.dark_green },

    NeogitDiffContextHighlight = { bg = palette.gray2 },
    NeogitDiffContext = { bg = palette.bg },
}
