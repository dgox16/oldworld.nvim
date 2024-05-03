local p = require("oldworld.palette")
local config = require("oldworld.config")
local terminal = require("oldworld.terminal")

local M = {}

local function load_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group_name, group_settings)
    end
end

local styles = vim.tbl_map(function(value)
    return setmetatable(value, {
        __add = function(a, b)
            return vim.tbl_extend("force", a, b)
        end,
    })
end, config.styles)

M.highlights = {
    Comment = { fg = p.gray05 } + styles.comments, -- any comment
    Constant = { fg = p.red }, -- any constant
    String = { fg = p.green }, -- a string constant: "this is a string"
    Character = { fg = p.green }, -- a character constant: 'p', '\n'
    Number = { fg = p.magenta }, -- a number constant: 234, 0xff
    Boolean = { fg = p.yellow } + styles.booleans, -- a boolean constant: TRUE, false
    Float = { fg = p.magenta }, -- a floating point constant: 2.3e10
    Identifier = { fg = p.fg } + styles.identifiers, -- any variable name
    Function = { fg = p.white } + styles.functions, -- function name (also: methods for classes)
    Statement = { fg = p.white }, -- any statement
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
    SpecialComment = { fg = p.gray05 }, -- special things inside a comment
    Debug = { fg = p.yellow }, -- debugging statements
    Underlined = { underline = true }, -- text that stands out, HTML links
    Error = { fg = p.orange }, -- any erroneous construct
    Todo = { fg = p.yellow }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    --
    -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
    ColorColumn = { bg = p.gray01 }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = p.gray01 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = p.black, bg = p.fg }, -- the character under the cursor
    lCursor = { fg = p.black, bg = p.fg }, -- the character under the cursor
    CursorIM = { fg = p.black, bg = p.fg }, -- the character under the cursor
    CursorLine = { bg = p.gray01 }, -- the screen line that the cursor is in when 'cursorline' is set
    Directory = { fg = p.purple }, -- directory names (and other special names in listings)
    DiffAdd = { bg = p.green, fg = p.black }, -- diff mode: Added line
    DiffChange = { fg = p.yellow, underline = true }, -- diff mode: Changed line
    DiffDelete = { bg = p.orange, fg = p.black }, -- diff mode: Deleted line
    DiffText = { bg = p.yellow, fg = p.black }, -- diff mode: Changed text within a changed line
    ErrorMsg = { fg = p.orange }, -- error messages on the command line
    VertSplit = { fg = p.gray02 }, -- the column separating vertically split windows
    WinSeparator = { fg = p.gray02 }, -- the column separating vertically split windows
    Folded = { fg = p.gray04 }, -- line used for closed folds
    FoldColumn = { bg = p.bg, fg = p.gray05 }, -- column where folds are displayed
    SignColumn = { bg = p.bg, fg = p.gray05 }, -- column where signs are displayed
    IncSearch = { fg = p.black, bg = p.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///p"
    CurSearch = { fg = p.black, bg = p.yellow }, -- 'cursearch' highlighting; also used for the text replaced with ":s///p"
    LineNr = { fg = p.gray04 }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = p.gray06 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = p.yellow, underline = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match.
    ModeMsg = { fg = p.gray03, bold = true }, --' showmode' message (e.g., "-- INSERT --")
    MoreMsg = { fg = p.bright_magenta }, -- more-prompt
    NonText = { fg = p.gray02 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., > displayed when a double-wide character doesn't fit at the end of the line).
    Normal = { fg = p.fg, bg = p.bg }, -- normal text
    NormalNC = { fg = p.fg, bg = p.bg_dark }, -- normal text
    NormalFloat = { fg = p.white, bg = p.gray00 }, -- Normal text in floating windows.
    FloatBorder = { fg = p.gray03, bg = p.bg }, -- Border of floating windows.
    Pmenu = { fg = p.white, bg = p.black }, -- Popup menu: normal item.
    PmenuSel = { fg = p.bright_white, bg = p.gray03 }, -- Popup menu: selected item.
    PmenuSbar = { bg = p.gray02 }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = p.gray03 }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = p.purple }, -- hit-enter prompt and yes/no questions
    QuickFixLine = { fg = p.red, bg = p.gray02 }, -- Current quickfix item in the quickfix window.
    Search = { fg = p.bright_yellow, bg = p.black }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey = { fg = p.special_grey }, -- Meta and special keys listed with  =map, also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
    SpellBad = { fg = p.orange, underline = true }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
    SpellCap = { fg = p.yellow }, -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
    SpellLocal = { fg = p.yellow }, -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
    SpellRare = { fg = p.yellow }, -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
    StatusLine = { fg = p.white, bg = p.gray01 }, -- status line of current window
    StatusLineNC = { fg = p.bg_dark }, -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineTerm = { fg = p.white, bg = p.gray01 }, -- status line of current :terminal window
    StatusLineTermNC = { fg = p.gray05 }, -- status line of non-current  =terminal window
    TabLine = { fg = p.gray05 }, -- tab pages line, not active tab page label
    TabLineFill = { bg = p.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = p.white }, -- tab pages line, active tab page label
    Terminal = { fg = p.fg, bg = p.black }, -- terminal window (see terminal-size-color)
    Title = { fg = p.green }, -- titles for output from " =set all", ":autocmd" etc.
    Visual = { bg = p.gray02 }, -- Visual mode selection
    VisualNOS = { bg = p.gray02 }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
    WarningMsg = { fg = p.yellow }, -- warning messages
    WildMenu = { fg = p.black, bg = p.purple }, -- current match in 'wildmenu' completion
    Winbar = { fg = p.white, bg = p.gray01 }, -- Winbar
    WinbarNC = { fg = p.gray05, bg = p.bg_dark }, -- Winbar non-current windows.

    -- HTML
    htmlArg = { fg = p.bright_purple, italic = true }, -- attributes
    htmlEndTag = { fg = p.gray06 }, -- end tag />
    htmlTitle = { fg = p.gray07 }, -- title tag text
    htmlTag = { fg = p.gray06 }, -- tag delimiters
    htmlTagN = { fg = p.gray06 },
    htmlTagName = { fg = p.red }, -- tag text

    -- Markdown
    markdownH1 = { fg = p.bright_purple, bold = true },
    markdownH2 = { fg = p.bright_purple, bold = true },
    markdownH3 = { fg = p.bright_purple, bold = true },
    markdownH4 = { fg = p.bright_purple, bold = true },
    markdownH5 = { fg = p.bright_purple, bold = true },
    markdownH6 = { fg = p.bright_purple, bold = true },
    markdownHeadingDelimiter = { fg = p.gray05 },
    markdownHeadingRule = { fg = p.gray05 },
    markdownId = { fg = p.red },
    markdownIdDeclaration = { fg = p.purple },
    markdownIdDelimiter = { fg = p.red },
    markdownLinkDelimiter = { fg = p.gray05 },
    markdownLinkText = { fg = p.purple, italic = true },
    markdownListMarker = { fg = p.gray05 },
    markdownOrderedListMarker = { fg = p.gray05 },
    markdownRule = { fg = p.gray05 },
    markdownUrl = { fg = p.green, bg = p.none },
    markdownBlockquote = { fg = p.gray07 },
    markdownBold = { fg = p.fg, bg = p.none, bold = true },
    markdownItalic = { fg = p.fg, bg = p.none, italic = true },
    markdownCode = { fg = p.yellow },
    markdownCodeBlock = { fg = p.yellow },
    markdownCodeDelimiter = { fg = p.gray05 },

    -- Tree sitter
    ["@boolean"] = { fg = p.yellow } + styles.booleans,
    ["@constructor"] = { fg = p.gray06 },
    ["@constant.builtin"] = { fg = p.yellow },
    ["@keyword.function"] = { fg = p.red } + styles.functions,
    ["@namespace"] = { fg = p.red, italic = true },
    ["@parameter"] = { fg = p.magenta },
    ["@property"] = { fg = p.gray07 },
    ["@punctuation"] = { fg = p.gray06 },
    ["@punctuation.delimiter"] = { fg = p.gray06 },
    ["@punctuation.bracket"] = { fg = p.gray06 },
    ["@punctuation.special"] = { fg = p.gray06 },
    ["@string.documentation"] = { fg = p.green } + styles.comments,
    ["@string.regex"] = { fg = p.purple },
    ["@string.escape"] = { fg = p.magenta },
    ["@symbol"] = { fg = p.yellow },
    ["@tag"] = { fg = p.red },
    ["@tag.attribute"] = { fg = p.bright_purple, italic = true },
    ["@tag.delimiter"] = { fg = p.gray06 },
    ["@type.builtin"] = { fg = p.magenta },
    ["@variable"] = { fg = p.fg } + styles.variables,
    ["@variable.builtin"] = { fg = p.purple } + styles.variables,
    ["@variable.parameter"] = { fg = p.magenta } + styles.variables,
    -- Tree sitter language specific overrides
    ["@constructor.javascript"] = { fg = p.red },
    ["@keyword.clojure"] = { fg = p.bright_red } + styles.keywords,

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = p.purple },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string.rust"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = p.error },
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = p.purple },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },

    ["@markup.heading"] = { fg = p.gray06, bold = true },
    ["@markup.heading.1"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.1.marker"] = { link = "@comment" },
    ["@markup.heading.2"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.2.marker"] = { link = "@comment" },
    ["@markup.heading.3"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.3.marker"] = { link = "@comment" },
    ["@markup.heading.4"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.4.marker"] = { link = "@comment" },
    ["@markup.heading.5"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.5.marker"] = { link = "@comment" },
    ["@markup.heading.6"] = { fg = p.gray06, bold = true, italic = true },
    ["@markup.heading.6.marker"] = { link = "@comment" },
    ["@markup.link"] = { fg = p.gray06 },
    ["@markup.link.label"] = { fg = p.red },
    ["@markup.link.url"] = { fg = p.purple },
    ["@markup.list"] = { fg = p.gray05, bold = true },
    ["@markup.list.checked"] = { fg = p.gray05 },
    ["@markup.list.unchecked"] = { fg = p.gray05 },
    ["@markup.raw.block"] = { fg = p.gray05 },
    ["@markup.raw.delimiter"] = { fg = p.gray05 },
    ["@markup.quote"] = { fg = p.gray06 },
    ["@markup.strikethrough"] = { fg = p.gray04, strikethrough = true },

    -- Diagnostics
    DiagnosticOk = { fg = p.green },
    DiagnosticError = { fg = p.orange },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.purple },
    DiagnosticHint = { fg = p.red },
    DiagnosticUnderlineError = { fg = p.orange, underline = true },
    DiagnosticUnderlineWarn = { fg = p.yellow, underline = true },
    DiagnosticUnderlineInfo = { fg = p.purple, underline = true },
    DiagnosticUnderlineHint = { fg = p.red, underline = true },

    -- Neovim's built-in language server client
    LspReferenceWrite = { fg = p.purple, underline = true },
    LspReferenceText = { fg = p.purple, underline = true },
    LspReferenceRead = { fg = p.purple, underline = true },
    LspSignatureActiveParameter = { fg = p.yellow, bold = true },

    -- GitSigns
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.orange },

    -- Diff
    diffAdded = { fg = p.bright_green },
    diffRemoved = { fg = p.bright_orange },
    diffChanged = { fg = p.bright_yellow },
    diffOldFile = { fg = p.gray04 },
    diffNewFile = { fg = p.white },
    diffFile = { fg = p.gray05 },
    diffLine = { fg = p.red },
    diffIndexLine = { fg = p.magenta },

    -- Hop
    HopNextKey = { fg = p.bright_yellow },
    HopNextKey1 = { fg = p.bright_purple },
    HopNextKey2 = { fg = p.bright_red },
    HopUnmatched = { fg = p.gray04 },
    HopCursor = { fg = p.bright_red },
    HopPreview = { fg = p.bright_purple },

    -- Cmp
    CmpItemAbbrDeprecated = { fg = p.gray06, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, bold = true },
    CmpItemMenu = { fg = p.gray05 },
    CmpItemKindText = { fg = p.gray06 },
    CmpItemKindFunction = { fg = p.red },
    CmpItemKindVariable = { fg = p.purple },
    CmpItemKindEnum = { fg = p.green },
    CmpItemKindSnippet = { fg = p.yellow },
    CmpItemKindField = { fg = p.magenta },
    CmpItemKindConstant = { fg = p.orange },
    CmpItemKindMethod = { fg = p.cyan },
    CmpBorder = { fg = p.gray03 },

    -- Navic
    NavicIconsFile = { fg = p.fg, bg = p.none },
    NavicIconsModule = { fg = p.yellow, bg = p.none },
    NavicIconsNamespace = { fg = p.fg, bg = p.none },
    NavicIconsPackage = { fg = p.fg, bg = p.none },
    NavicIconsClass = { fg = p.red, bg = p.none },
    NavicIconsMethod = { fg = p.purple, bg = p.none },
    NavicIconsProperty = { fg = p.green, bg = p.none },
    NavicIconsField = { fg = p.green, bg = p.none },
    NavicIconsConstructor = { fg = p.red, bg = p.none },
    NavicIconsEnum = { fg = p.red, bg = p.none },
    NavicIconsInterface = { fg = p.red, bg = p.none },
    NavicIconsFunction = { fg = p.purple, bg = p.none },
    NavicIconsVariable = { fg = p.magenta, bg = p.none },
    NavicIconsConstant = { fg = p.magenta, bg = p.none },
    NavicIconsString = { fg = p.green, bg = p.none },
    NavicIconsNumber = { fg = p.red, bg = p.none },
    NavicIconsBoolean = { fg = p.yellow, bg = p.none },
    NavicIconsArray = { fg = p.gray06, bg = p.none },
    NavicIconsObject = { fg = p.gray06, bg = p.none },
    NavicIconsKey = { fg = p.purple, bg = p.none },
    NavicIconsKeyword = { fg = p.purple, bg = p.none },
    NavicIconsNull = { fg = p.red, bg = p.none },
    NavicIconsEnumMember = { fg = p.green, bg = p.none },
    NavicIconsStruct = { fg = p.red, bg = p.none },
    NavicIconsEvent = { fg = p.red, bg = p.none },
    NavicIconsOperator = { fg = p.fg, bg = p.none },
    NavicIconsTypeParameter = { fg = p.green, bg = p.none },
    NavicText = { fg = p.white, bg = p.none },
    NavicSeparator = { fg = p.gray06, bg = p.none },

    -- Notify
    NotifyBackground = { fg = p.white, bg = p.bg },
    NotifyERRORBorder = { fg = p.orange, bg = p.bg },
    NotifyWARNBorder = { fg = p.yellow, bg = p.bg },
    NotifyINFOBorder = { fg = p.purple, bg = p.bg },
    NotifyDEBUGBorder = { fg = p.gray06, bg = p.bg },
    NotifyTRACEBorder = { fg = p.red, bg = p.bg },
    NotifyERRORIcon = { fg = p.bright_orange },
    NotifyWARNIcon = { fg = p.bright_yellow },
    NotifyINFOIcon = { fg = p.bright_purple },
    NotifyDEBUGIcon = { fg = p.gray05 },
    NotifyTRACEIcon = { fg = p.bright_red },
    NotifyERRORTitle = { fg = p.bright_orange },
    NotifyWARNTitle = { fg = p.bright_yellow },
    NotifyINFOTitle = { fg = p.bright_purple },
    NotifyDEBUGTitle = { fg = p.gray05 },
    NotifyTRACETitle = { fg = p.bright_red },
    NotifyERRORBody = { fg = p.white, bg = p.bg },
    NotifyWARNBody = { fg = p.white, bg = p.bg },
    NotifyINFOBody = { fg = p.white, bg = p.bg },
    NotifyDEBUGBody = { fg = p.white, bg = p.bg },
    NotifyTRACEBody = { fg = p.white, bg = p.bg },

    -- NeoTree
    NeoTreeFloatBorder = { fg = p.gray03, bg = p.bg },
    NeoTreeFloatTitle = { fg = p.gray05, bg = p.gray07 },
    NeoTreeTitleBar = { fg = p.gray05, bg = p.gray01 },

    -- Telescope
    TelescopeBorder = { fg = p.bg, bg = p.bg },
    TelescopeNormal = { fg = p.fg, bg = p.bg },
    TelescopePreviewTitle = { fg = p.black, bg = p.cyan, bold = true },
    TelescopeResultsTitle = { fg = p.bg, bg = p.bg },
    TelescopePromptTitle = { fg = p.black, bg = p.red, bold = true },
    TelescopePromptBorder = { fg = p.gray01, bg = p.gray01 },
    TelescopePromptNormal = { fg = p.gray06, bg = p.gray01 },
    TelescopePromptCounter = { fg = p.gray04, bg = p.gray01 },
    TelescopeMatching = { fg = p.yellow, underline = true },

    -- Rainbow-delimeters
    RainbowDelimiterRed = { fg = p.red, bg = p.bg },
    RainbowDelimiterYellow = { fg = p.yellow, bg = p.bg },
    RainbowDelimiterBlue = { fg = p.blue, bg = p.bg },
    RainbowDelimiterOrange = { fg = p.orange, bg = p.bg },
    RainbowDelimiterGreen = { fg = p.green, bg = p.bg },
    RainbowDelimiterViolet = { fg = p.purple, bg = p.bg },
    RainbowDelimiterCyan = { fg = p.cyan, bg = p.bg },

    -- Alpha
    AlphaHeader = { fg = p.purple, bg = p.bg },
    AlphaFooter = { fg = p.gray05, bg = p.bg, italic = true },
    AlphaShortcut = { fg = p.cyan, italic = true },

    -- Mason
    MasonHeader = { fg = p.fg, bg = p.bg, bold = true },
    MasonHeaderSecondary = { fg = p.fg, bg = p.bg, bold = true },
    MasonHighlight = { fg = p.green },
    MasonHighlightBlockBold = { bg = p.white, fg = p.bg, bold = true },
    MasonHighlightSecondary = { fg = p.blue },

    -- Flash
    FlashLabel = { fg = p.green, bg = p.bg, bold = true },
    FlashBackdrop = { fg = p.gray03 },
    FlashMatch = { fg = p.purple, bg = p.bg },
    FlashCurrent = { fg = p.cyan, bg = p.bg },
}

function M.setup()
    load_highlights(M.highlights)
    if config.terminal_colors then
        terminal.setup()
    end
end

return M
