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
}

function config.setup(opts)
    if opts == nil then
        return
    end

    for k, v in pairs(opts) do
        if type(v) == "table" and default_config[k] then
            config[k] = vim.tbl_deep_extend("keep", default_config[k], v)
        else
            config[k] = v
        end
    end
end

return setmetatable(config, { __index = default_config })
