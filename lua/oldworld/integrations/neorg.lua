return {
    -- Neorg 7 seems to link to some of the 'text.*' highlight groups
    ["@text.underline"] = { link = "Underlined" },
    ["@text.strong"] = { bold = true },
    ["@text.strikethrough"] = { strikethrough = true },
    ["@text.italic"] = { italic = true },

    -- Neorg 7 links italics to regular text instead of italics
    ["@neorg.markup.italic.norg"] = { link = "@text.italic" },

    -- Neorg 8 commits to linking to the highlight groups defined by treesitter:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
    ["@markup.underline"] = { link = "@text.underline" },
    ["@markup.strong"] = { link = "@text.strong" },
    ["@markup.italic"] = { link = "@text.italic" },
    ["@markup.strikethrough"] = { link = "@text.strikethrough" },
}
