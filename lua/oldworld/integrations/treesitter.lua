local p = require("oldworld.palette")
local config = require("oldworld.config")

local styles = vim.tbl_map(function(value)
    return setmetatable(value, {
        __add = function(a, b)
            return vim.tbl_extend("force", a, b)
        end,
    })
end, config.styles)

return {
    ["@boolean"] = { fg = p.yellow } + styles.booleans,
    ["@constructor"] = { fg = p.subtext1 },
    ["@constant.builtin"] = { fg = p.yellow },
    ["@keyword.function"] = { fg = p.red } + styles.functions,
    ["@namespace"] = { fg = p.red, italic = true },
    ["@parameter"] = { fg = p.magenta },
    ["@property"] = { fg = p.fg },
    ["@punctuation"] = { fg = p.subtext1 },
    ["@punctuation.delimiter"] = { fg = p.subtext1 },
    ["@punctuation.bracket"] = { fg = p.subtext1 },
    ["@punctuation.special"] = { fg = p.subtext1 },
    ["@string.documentation"] = { fg = p.green } + styles.comments,
    ["@string.regex"] = { fg = p.purple },
    ["@string.escape"] = { fg = p.magenta },
    ["@symbol"] = { fg = p.yellow },
    ["@tag"] = { fg = p.red },
    ["@tag.attribute"] = { fg = p.bright_purple, italic = true },
    ["@tag.delimiter"] = { fg = p.subtext1 },
    ["@type.builtin"] = { fg = p.magenta },
    ["@variable"] = { fg = p.fg } + styles.variables,
    ["@variable.builtin"] = { fg = p.purple } + styles.variables,
    ["@variable.parameter"] = { fg = p.magenta } + styles.variables,
    ["@constructor.javascript"] = { fg = p.red },
    ["@keyword.clojure"] = { fg = p.bright_red } + styles.keywords,
}
