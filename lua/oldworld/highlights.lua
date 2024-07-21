local config = require("oldworld.config")
local editor_highlights = require("oldworld.groups.editor")
local syntax_highlights = require("oldworld.groups.syntax")
local terminal = require("oldworld.terminal")

local M = {}

local integrations_highlights = {
    alpha = require("oldworld.groups.integrations.alpha"),
    cmp = require("oldworld.groups.integrations.cmp"),
    flash = require("oldworld.groups.integrations.flash"),
    gitsigns = require("oldworld.groups.integrations.gitsigns"),
    hop = require("oldworld.groups.integrations.hop"),
    indent_blankline = require("oldworld.groups.integrations.indent_blankline"),
    lazy = require("oldworld.groups.integrations.lazy"),
    lsp = require("oldworld.groups.integrations.lsp"),
    markdown = require("oldworld.groups.integrations.markdown"),
    mason = require("oldworld.groups.integrations.mason"),
    mini = require("oldworld.groups.integrations.mini"),
    navic = require("oldworld.groups.integrations.navic"),
    neo_tree = require("oldworld.groups.integrations.neo_tree"),
    neorg = require("oldworld.groups.integrations.neorg"),
    noice = require("oldworld.groups.integrations.noice"),
    notify = require("oldworld.groups.integrations.notify"),
    rainbow_delimiters = require("oldworld.groups.integrations.rainbow_delimiters"),
    telescope = require("oldworld.groups.integrations.telescope"),
    treesitter = require("oldworld.groups.integrations.treesitter"),
    illuminate = require("oldworld.groups.integrations.illuminate"),
}
local integrations = {}

for integration, enabled in pairs(config.integrations) do
    if enabled then
        local highlights = integrations_highlights[integration]
        table.insert(integrations, { enabled = true, highlights = highlights })
    end
end

local function load_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group_name, group_settings)
    end
end

function M.setup()
    load_highlights(editor_highlights)
    load_highlights(syntax_highlights)
    for _, plugin in ipairs(integrations) do
        if plugin.enabled then
            load_highlights(plugin.highlights)
        end
    end

    load_highlights(config.highlight_overrides)

    if config.terminal_colors then
        terminal.setup()
    end
end

return M
