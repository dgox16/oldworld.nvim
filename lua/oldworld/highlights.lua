local config = require("oldworld.config")
local defaults_highlights = require("oldworld.integrations.NormalNvim")
local terminal = require("oldworld.terminal")

local M = {}

local groups_highlights = {
    alpha = require("oldworld.integrations.alpha"),
    cmp = require("oldworld.integrations.cmp"),
    flash = require("oldworld.integrations.flash"),
    gitsigns = require("oldworld.integrations.gitsigns"),
    hop = require("oldworld.integrations.hop"),
    indent_blankline = require("oldworld.integrations.indent_blankline"),
    lazy = require("oldworld.integrations.lazy"),
    lsp = require("oldworld.integrations.lsp"),
    markdown = require("oldworld.integrations.markdown"),
    mason = require("oldworld.integrations.mason"),
    navic = require("oldworld.integrations.navic"),
    neo_tree = require("oldworld.integrations.neo_tree"),
    neorg = require("oldworld.integrations.neorg"),
    noice = require("oldworld.integrations.noice"),
    notify = require("oldworld.integrations.notify"),
    rainbow_delimiters = require("oldworld.integrations.rainbow_delimiters"),
    telescope = require("oldworld.integrations.telescope"),
    treesitter = require("oldworld.integrations.treesitter"),
}
local integrations = {}

for integration, enabled in pairs(config.integrations) do
    if enabled then
        local highlights = groups_highlights[integration]
        table.insert(integrations, { enabled = true, highlights = highlights })
    end
end

local function load_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group_name, group_settings)
    end
end

function M.setup()
    load_highlights(defaults_highlights)
    for _, plugin in ipairs(integrations) do
        if plugin.enabled then
            load_highlights(plugin.highlights)
        end
    end
    if config.terminal_colors then
        terminal.setup()
    end
end

return M
