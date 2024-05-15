local p = require("oldworld.palette")
local config = require("oldworld.config")

local styles = vim.tbl_map(function(value)
    return setmetatable(value, {
        __add = function(a, b)
            return vim.tbl_extend("force", a, b)
        end,
    })
end, config.styles)

return {
    Comment = { fg = p.subtext4 } + styles.comments, -- any comment
    Constant = { fg = p.red }, -- any constant
    String = { fg = p.green }, -- a string constant: "this is a string"
    Character = { fg = p.green }, -- a character constant: 'p', '\n'
    Number = { fg = p.magenta }, -- a number constant: 234, 0xff
    Boolean = { fg = p.yellow } + styles.booleans, -- a boolean constant: TRUE, false
    Float = { fg = p.magenta }, -- a floating point constant: 2.3e10
    Identifier = { fg = p.fg } + styles.identifiers, -- any variable name
    Function = { fg = p.fg } + styles.functions, -- function name (also: methods for classes)
    Statement = { fg = p.fg }, -- any statement
    Conditional = { fg = p.blue }, -- if, then, else, endif, switch, etc.
    Repeat = { fg = p.purple }, -- for, do, while, etc.
    Label = { fg = p.purple }, -- case, default, etc.
    Operator = { fg = p.yellow }, -- sizeof", "+", "*", etc.
    Keyword = { fg = p.purple } + styles.keywords, -- any other keyword
    Exception = { fg = p.purple }, -- try, catch, throw
    PreProc = { fg = p.red }, -- generic Preprocessor
    Include = { fg = p.purple }, -- preprocessor #include
    Define = { fg = p.red }, -- preprocessor #define
    Macro = { fg = p.red }, -- same as Define
    PreCondit = { fg = p.red }, -- preprocessor #if, #else, #endif, etc.
    Type = { fg = p.yellow }, -- int, long, char, etc.
    StorageClass = { fg = p.yellow }, -- static, register, volatile, etc.
    Structure = { fg = p.red }, -- struct, union, enum, etc.
    Typedef = { fg = p.yellow }, -- A typedef
    Special = { fg = p.blue }, -- any special symbol
    SpecialChar = { fg = p.yellow }, -- special character in a constant
    Tag = { fg = p.yellow }, -- you can use CTRL-] on this
    SpecialComment = { fg = p.subtext4 }, -- special things inside a comment
    Debug = { fg = p.yellow }, -- debugging statements
    Underlined = { underline = true }, -- text that stands out, HTML links
    Error = { fg = p.orange }, -- any erroneous construct
    Todo = { fg = p.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    --
    -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
    ColorColumn = { bg = p.gray1 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = p.gray1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = p.black, bg = p.fg }, -- the character under the cursor
    lCursor = { fg = p.black, bg = p.fg }, -- the character under the cursor
    CursorIM = { fg = p.black, bg = p.fg }, -- the character under the cursor
    CursorLine = { bg = p.gray1 }, -- the screen line that the cursor is in when 'cursorline' is set
    Directory = { fg = p.purple }, -- directory names (and other special names in listings)
    DiffAdd = { bg = p.green, fg = p.black }, -- diff mode: Added line
    DiffChange = { fg = p.yellow, underline = true }, -- diff mode: Changed line
    DiffDelete = { bg = p.orange, fg = p.black }, -- diff mode: Deleted line
    DiffText = { bg = p.yellow, fg = p.black }, -- diff mode: Changed text within a changed line
    ErrorMsg = { fg = p.orange }, -- error messages on the command line
    VertSplit = { fg = p.gray2 }, -- the column separating vertically split windows
    WinSeparator = { fg = p.gray2 }, -- the column separating vertically split windows
    Folded = { fg = p.gray4 }, -- line used for closed folds
    FoldColumn = { bg = p.bg, fg = p.subtext4 }, -- column where folds are displayed
    SignColumn = { bg = p.bg, fg = p.subtext4 }, -- column where signs are displayed
    IncSearch = { fg = p.black, bg = p.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///p"
    CurSearch = { fg = p.black, bg = p.yellow }, -- 'cursearch' highlighting; also used for the text replaced with ":s///p"
    LineNr = { fg = p.gray4 }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = p.subtext1 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = p.yellow, underline = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    ModeMsg = { fg = p.gray3, bold = true }, --' showmode' message (e.g., "-- INSERT --")
    MoreMsg = { fg = p.bright_magenta }, -- more-prompt
    NonText = { fg = p.gray4 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., > displayed when a double-wide character doesn't fit at the end of the line).
    EndOfBuffer = { fg = p.bg },
    Normal = { fg = p.fg, bg = p.bg }, -- normal text
    NormalNC = { fg = p.fg, bg = p.bg_dark }, -- normal text
    NormalFloat = { fg = p.fg, bg = p.gray0 }, -- Normal text in floating windows.
    FloatBorder = { fg = p.gray3, bg = p.bg }, -- Border of floating windows.
    Pmenu = { fg = p.fg, bg = p.black }, -- Popup menu: normal item.
    PmenuSel = { fg = p.white, bg = p.gray3 }, -- Popup menu: selected item.
    PmenuSbar = { bg = p.gray2 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = p.gray3 }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = p.purple }, -- hit-enter prompt and yes/no questions
    QuickFixLine = { fg = p.red, bg = p.gray2 }, -- Current quickfix item in the quickfix window.
    Search = { fg = p.bright_yellow, bg = p.black }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey = { fg = p.special_grey }, -- Meta and special keys listed with  =map, also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    SpellBad = { fg = p.orange, underline = true }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    SpellCap = { fg = p.yellow }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    SpellLocal = { fg = p.yellow }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    SpellRare = { fg = p.yellow }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
    StatusLine = { fg = p.fg, bg = p.gray1 }, -- status line of current window
    StatusLineNC = { fg = p.bg_dark }, -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTerm = { fg = p.fg, bg = p.gray1 }, -- status line of current :terminal window
    StatusLineTermNC = { fg = p.subtext4 }, -- status line of non-current  =terminal window
    TabLine = { fg = p.subtext4 }, -- tab pages line, not active tab page label
    TabLineFill = { bg = p.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = p.fg }, -- tab pages line, active tab page label
    Terminal = { fg = p.fg, bg = p.black }, -- terminal window (see terminal-size-color)
    Title = { fg = p.green }, -- titles for output from " =set all", ":autocmd" etc.
    Italic = { fg = p.blue, italic = true },
    Visual = { bg = p.gray3 }, -- Visual mode selection
    VisualNOS = { bg = p.gray3 }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    WarningMsg = { fg = p.yellow }, -- warning messages
    WildMenu = { fg = p.black, bg = p.purple }, -- current match in 'wildmenu' completion
    Winbar = { fg = p.fg, bg = p.gray1 }, -- Winbar
    WinbarNC = { fg = p.subtext4, bg = p.bg_dark }, -- Winbar non-current windows.

    -- HTML
    htmlArg = { fg = p.bright_purple, italic = true }, -- attributes
    htmlEndTag = { fg = p.subtext1 }, -- end tag />
    htmlTitle = { fg = p.fg }, -- title tag text
    htmlTag = { fg = p.subtext1 }, -- tag delimiters
    htmlTagN = { fg = p.subtext1 },
    htmlTagName = { fg = p.red }, -- tag text

    -- Diff
    diffAdded = { fg = p.bright_green },
    diffRemoved = { fg = p.bright_orange },
    diffChanged = { fg = p.bright_yellow },
    diffOldFile = { fg = p.gray4 },
    diffNewFile = { fg = p.fg },
    diffFile = { fg = p.subtext4 },
    diffLine = { fg = p.red },
    diffIndexLine = { fg = p.magenta },
}
