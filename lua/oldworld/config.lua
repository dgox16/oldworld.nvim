local config = {}

local default_config = {
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = {},
        identifiers = {},
        functions = { italic = true },
        variables = {},
        booleans = {},
    },
    integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        hop = false,
        indent_blankline = true,
        lazy = true,
        lsp = true,
        markdown = true,
        mason = true,
        navic = false,
        neo_tree = false,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter = true,
    },
}

function config.setup(opts)
    if opts == nil then
        return
    end

    for k, v in pairs(opts) do
        if k == "integrations" then
            for integration, enabled in pairs(v) do
                default_config.integrations[integration] = enabled
            end
        elseif type(v) == "table" and default_config[k] then
            config[k] = vim.tbl_deep_extend("keep", default_config[k], v)
        else
            config[k] = v
        end
    end
end

return setmetatable(config, { __index = default_config })
