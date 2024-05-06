local p = require("oldworld.palette")

return {
    CmpItemAbbrDeprecated = { fg = p.subtext1, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, bold = true },
    CmpItemMenu = { fg = p.subtext4 },
    CmpItemKindText = { fg = p.subtext1 },
    CmpItemKindFunction = { fg = p.red },
    CmpItemKindVariable = { fg = p.purple },
    CmpItemKindEnum = { fg = p.green },
    CmpItemKindSnippet = { fg = p.yellow },
    CmpItemKindField = { fg = p.magenta },
    CmpItemKindConstant = { fg = p.orange },
    CmpItemKindMethod = { fg = p.cyan },
    CmpBorder = { fg = p.gray3 },
}
