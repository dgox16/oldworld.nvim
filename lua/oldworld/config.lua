local config = {}

local default_config = {
    terminal_colors = true,
    variants = "default",
    styles = {
        comments = {},
        keywords = {},
        identifiers = {},
        functions = {},
        variables = {},
        booleans = {},
    },
    integrations = {
        alpha = true,
        blink = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        hop = true,
        indent_blankline = true,
        lazy = true,
        lsp = true,
        markdown = true,
        mason = true,
        mini = true,
        navic = true,
        neo_tree = true,
        neogit = true,
        neorg = true,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        render_markdown = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        illuminate = true,
    },
    highlight_overrides = {},
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
        elseif k == "styles" then
            for style_key, style_value in pairs(v) do
                if default_config.styles[style_key] ~= nil then
                    config.styles[style_key] =
                        vim.tbl_deep_extend("keep", default_config.styles[style_key], style_value)
                end
            end
        else
            config[k] = v
        end
    end
end

return setmetatable(config, { __index = default_config })
