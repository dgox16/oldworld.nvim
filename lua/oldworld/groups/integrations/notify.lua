local p = require("oldworld.palette")
local u = require("oldworld.utils.color_utils")

return {
    NotifyBackground = { fg = p.fg, bg = p.bg },
    NotifyERRORBorder = { fg = p.orange, bg = p.bg },
    NotifyWARNBorder = { fg = p.yellow, bg = p.bg },
    NotifyINFOBorder = { fg = p.purple, bg = p.bg },
    NotifyDEBUGBorder = { fg = p.subtext1, bg = p.bg },
    NotifyTRACEBorder = { fg = p.red, bg = p.bg },
    NotifyERRORIcon = { fg = u.lighten(p.orange, 0.5, p.fg) },
    NotifyWARNIcon = { fg = u.lighten(p.yellow, 0.5, p.fg) },
    NotifyINFOIcon = { fg = u.lighten(p.purple, 0.5, p.fg) },
    NotifyDEBUGIcon = { fg = p.subtext4 },
    NotifyTRACEIcon = { fg = u.lighten(p.red, 0.5, p.fg) },
    NotifyERRORTitle = { fg = u.lighten(p.orange, 0.5, p.fg) },
    NotifyWARNTitle = { fg = u.lighten(p.yellow, 0.5, p.fg) },
    NotifyINFOTitle = { fg = u.lighten(p.purple, 0.5, p.fg) },
    NotifyDEBUGTitle = { fg = p.subtext4 },
    NotifyTRACETitle = { fg = u.lighten(p.red, 0.5, p.fg) },
    NotifyERRORBody = { fg = p.fg, bg = p.bg },
    NotifyWARNBody = { fg = p.fg, bg = p.bg },
    NotifyINFOBody = { fg = p.fg, bg = p.bg },
    NotifyDEBUGBody = { fg = p.fg, bg = p.bg },
    NotifyTRACEBody = { fg = p.fg, bg = p.bg },
}
