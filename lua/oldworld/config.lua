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
    for k, v in pairs(opts or {}) do
        if type(v) == "table" then
            config[k] = {}
            for kk, vv in pairs(v) do
                config[k][kk] = vv
            end
        else
            config[k] = v
        end
    end
end

return setmetatable(config, { __index = default_config })
