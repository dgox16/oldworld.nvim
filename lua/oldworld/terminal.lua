local M = {}
local p = require("oldworld.palette")
local u = require("oldworld.utils.color_utils")

function M.setup()
    vim.g.terminal_color_0 = p.black
    vim.g.terminal_color_1 = p.red
    vim.g.terminal_color_2 = p.green
    vim.g.terminal_color_3 = p.yellow
    vim.g.terminal_color_4 = p.blue
    vim.g.terminal_color_5 = p.purple
    vim.g.terminal_color_6 = p.cyan
    vim.g.terminal_color_7 = p.fg
    vim.g.terminal_color_8 = u.lighten(p.bg, 0.5, p.fg)
    vim.g.terminal_color_9 = u.lighten(p.red, 0.5, p.fg)
    vim.g.terminal_color_10 = u.lighten(p.green, 0.5, p.fg)
    vim.g.terminal_color_11 = u.lighten(p.yellow, 0.5, p.fg)
    vim.g.terminal_color_12 = u.lighten(p.blue, 0.5, p.fg)
    vim.g.terminal_color_13 = u.lighten(p.purple, 0.5, p.fg)
    vim.g.terminal_color_14 = u.lighten(p.cyan, 0.5, p.fg)
    vim.g.terminal_color_15 = p.fg
    vim.g.terminal_color_background = p.bg
    vim.g.terminal_color_foreground = p.fg
end

return M
