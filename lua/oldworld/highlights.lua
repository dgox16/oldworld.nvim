local config = require("oldworld.config")
local editor_highlights = require("oldworld.groups.editor")
local syntax_highlights = require("oldworld.groups.syntax")
local terminal = require("oldworld.terminal")

local M = {}

local function load_highlights(highlights)
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

function M.setup()
    load_highlights(editor_highlights)
    load_highlights(syntax_highlights)

    for integration, enabled in pairs(config.integrations) do
        if enabled then
            local highlights = require("oldworld.groups.integrations." .. integration)
            if highlights then
                load_highlights(highlights)
            end
        end
    end

    load_highlights(config.highlight_overrides)

    if config.terminal_colors then
        terminal.setup()
    end
end

return M
