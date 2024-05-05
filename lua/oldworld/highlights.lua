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
    NonText = { fg = p.subtext4 }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., > displayed when a double-wide character doesn't fit at the end of the line).
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
    Visual = { bg = p.gray2 }, -- Visual mode selection
    VisualNOS = { bg = p.gray2 }, -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
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

    -- Markdown
    markdownH1 = { fg = p.bright_purple, bold = true },
    markdownH2 = { fg = p.bright_purple, bold = true },
    markdownH3 = { fg = p.bright_purple, bold = true },
    markdownH4 = { fg = p.bright_purple, bold = true },
    markdownH5 = { fg = p.bright_purple, bold = true },
    markdownH6 = { fg = p.bright_purple, bold = true },
    markdownHeadingDelimiter = { fg = p.subtext4 },
    markdownHeadingRule = { fg = p.subtext4 },
    markdownId = { fg = p.red },
    markdownIdDeclaration = { fg = p.purple },
    markdownIdDelimiter = { fg = p.red },
    markdownLinkDelimiter = { fg = p.subtext4 },
    markdownLinkText = { fg = p.purple, italic = true },
    markdownListMarker = { fg = p.subtext4 },
    markdownOrderedListMarker = { fg = p.subtext4 },
    markdownRule = { fg = p.subtext4 },
    markdownUrl = { fg = p.green, bg = p.none },
    markdownBlockquote = { fg = p.fg },
    markdownBold = { fg = p.fg, bg = p.none, bold = true },
    markdownItalic = { fg = p.fg, bg = p.none, italic = true },
    markdownCode = { fg = p.yellow },
    markdownCodeBlock = { fg = p.yellow },
    markdownCodeDelimiter = { fg = p.subtext4 },

    -- Tree sitter
    ["@boolean"] = { fg = p.yellow } + styles.booleans,
    ["@constructor"] = { fg = p.subtext1 },
    ["@constant.builtin"] = { fg = p.yellow },
    ["@keyword.function"] = { fg = p.red } + styles.functions,
    ["@namespace"] = { fg = p.red, italic = true },
    ["@parameter"] = { fg = p.magenta },
    ["@property"] = { fg = p.fg },
    ["@punctuation"] = { fg = p.subtext1 },
    ["@punctuation.delimiter"] = { fg = p.subtext1 },
    ["@punctuation.bracket"] = { fg = p.subtext1 },
    ["@punctuation.special"] = { fg = p.subtext1 },
    ["@string.documentation"] = { fg = p.green } + styles.comments,
    ["@string.regex"] = { fg = p.purple },
    ["@string.escape"] = { fg = p.magenta },
    ["@symbol"] = { fg = p.yellow },
    ["@tag"] = { fg = p.red },
    ["@tag.attribute"] = { fg = p.bright_purple, italic = true },
    ["@tag.delimiter"] = { fg = p.subtext1 },
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

    ["@markup.heading"] = { fg = p.fg, bold = true },
    ["@markup.heading.1"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.1.marker"] = { link = "@comment" },
    ["@markup.heading.2"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.2.marker"] = { link = "@comment" },
    ["@markup.heading.3"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.3.marker"] = { link = "@comment" },
    ["@markup.heading.4"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.4.marker"] = { link = "@comment" },
    ["@markup.heading.5"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.5.marker"] = { link = "@comment" },
    ["@markup.heading.6"] = { fg = p.fg, bold = true, italic = true },
    ["@markup.heading.6.marker"] = { link = "@comment" },
    ["@markup.link"] = { fg = p.subtext1 },
    ["@markup.link.label"] = { fg = p.red },
    ["@markup.link.url"] = { fg = p.purple },
    ["@markup.list"] = { fg = p.subtext4, bold = true },
    ["@markup.list.checked"] = { fg = p.subtext4 },
    ["@markup.list.unchecked"] = { fg = p.subtext4 },
    ["@markup.raw.block"] = { fg = p.subtext4 },
    ["@markup.raw.delimiter"] = { fg = p.subtext4 },
    ["@markup.quote"] = { fg = p.subtext1 },
    ["@markup.strikethrough"] = { fg = p.gray4, strikethrough = true },

    -- Diagnostics
    DiagnosticOk = { fg = p.green },
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.purple },
    DiagnosticHint = { fg = p.cyan },
    DiagnosticUnderlineError = { fg = p.red, underline = true },
    DiagnosticUnderlineWarn = { fg = p.yellow, underline = true },
    DiagnosticUnderlineInfo = { fg = p.purple, underline = true },
    DiagnosticUnderlineHint = { fg = p.cyan, underline = true },

    -- Neovim's built-in language server client
    LspReferenceWrite = { fg = p.purple, underline = true },
    LspReferenceText = { fg = p.purple, underline = true },
    LspReferenceRead = { fg = p.purple, underline = true },
    LspSignatureActiveParameter = { fg = p.yellow, bold = true },

    -- GitSigns
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },

    -- Diff
    diffAdded = { fg = p.bright_green },
    diffRemoved = { fg = p.bright_orange },
    diffChanged = { fg = p.bright_yellow },
    diffOldFile = { fg = p.gray4 },
    diffNewFile = { fg = p.fg },
    diffFile = { fg = p.subtext4 },
    diffLine = { fg = p.red },
    diffIndexLine = { fg = p.magenta },

    -- Hop
    HopNextKey = { fg = p.bright_yellow },
    HopNextKey1 = { fg = p.bright_purple },
    HopNextKey2 = { fg = p.bright_red },
    HopUnmatched = { fg = p.gray4 },
    HopCursor = { fg = p.bright_red },
    HopPreview = { fg = p.bright_purple },

    -- Cmp
    CmpItemAbbrDeprecated = { fg = p.subtext1, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.blue, bold = true },
    CmpItemMenu = { fg = p.subtext4 },
    CmpItemKindText = { fg = p.subtext1 },
    CmpItemKindFunction = { fg = p.red },
    CmpItemKindVariable = { fg = p.purple },
    CmpItemKindEnum = { fg = p.green },
    CmpItemKindSnippet = { fg = p.yellow },
    CmpItemKindField = { fg = p.magenta },
    CmpItemKindConstant = { fg = p.orange },
    CmpItemKindMethod = { fg = p.cyan },
    CmpBorder = { fg = p.gray3 },

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
    NavicIconsArray = { fg = p.subtext1, bg = p.none },
    NavicIconsObject = { fg = p.subtext1, bg = p.none },
    NavicIconsKey = { fg = p.purple, bg = p.none },
    NavicIconsKeyword = { fg = p.purple, bg = p.none },
    NavicIconsNull = { fg = p.red, bg = p.none },
    NavicIconsEnumMember = { fg = p.green, bg = p.none },
    NavicIconsStruct = { fg = p.red, bg = p.none },
    NavicIconsEvent = { fg = p.red, bg = p.none },
    NavicIconsOperator = { fg = p.fg, bg = p.none },
    NavicIconsTypeParameter = { fg = p.green, bg = p.none },
    NavicText = { fg = p.fg, bg = p.none },
    NavicSeparator = { fg = p.subtext1, bg = p.none },

    -- Notify
    NotifyBackground = { fg = p.fg, bg = p.bg },
    NotifyERRORBorder = { fg = p.orange, bg = p.bg },
    NotifyWARNBorder = { fg = p.yellow, bg = p.bg },
    NotifyINFOBorder = { fg = p.purple, bg = p.bg },
    NotifyDEBUGBorder = { fg = p.subtext1, bg = p.bg },
    NotifyTRACEBorder = { fg = p.red, bg = p.bg },
    NotifyERRORIcon = { fg = p.bright_orange },
    NotifyWARNIcon = { fg = p.bright_yellow },
    NotifyINFOIcon = { fg = p.bright_purple },
    NotifyDEBUGIcon = { fg = p.subtext4 },
    NotifyTRACEIcon = { fg = p.bright_red },
    NotifyERRORTitle = { fg = p.bright_orange },
    NotifyWARNTitle = { fg = p.bright_yellow },
    NotifyINFOTitle = { fg = p.bright_purple },
    NotifyDEBUGTitle = { fg = p.subtext4 },
    NotifyTRACETitle = { fg = p.bright_red },
    NotifyERRORBody = { fg = p.fg, bg = p.bg },
    NotifyWARNBody = { fg = p.fg, bg = p.bg },
    NotifyINFOBody = { fg = p.fg, bg = p.bg },
    NotifyDEBUGBody = { fg = p.fg, bg = p.bg },
    NotifyTRACEBody = { fg = p.fg, bg = p.bg },

    -- NeoTree
    NeoTreeFloatBorder = { fg = p.gray3, bg = p.bg },
    NeoTreeFloatTitle = { fg = p.subtext4, bg = p.fg },
    NeoTreeTitleBar = { fg = p.subtext4, bg = p.gray1 },

    -- Telescope
    TelescopeBorder = { fg = p.bg, bg = p.bg },
    TelescopeNormal = { fg = p.fg, bg = p.bg },
    TelescopePreviewTitle = { fg = p.black, bg = p.cyan, bold = true },
    TelescopeResultsTitle = { fg = p.bg, bg = p.bg },
    TelescopePromptTitle = { fg = p.black, bg = p.red, bold = true },
    TelescopePromptBorder = { fg = p.gray1, bg = p.gray1 },
    TelescopePromptNormal = { fg = p.fg, bg = p.gray1 },
    TelescopePromptCounter = { fg = p.gray4, bg = p.gray1 },
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
    AlphaFooter = { fg = p.subtext4, bg = p.bg, italic = true },
    AlphaShortcut = { fg = p.cyan, italic = true },

    -- Mason
    MasonHeader = { fg = p.fg, bg = p.bg, bold = true },
    MasonHeaderSecondary = { fg = p.fg, bg = p.bg, bold = true },
    MasonHighlight = { fg = p.green },
    MasonHighlightBlockBold = { bg = p.fg, fg = p.bg, bold = true },
    MasonHighlightSecondary = { fg = p.blue },
    MasonMuted = { fg = p.subtext4 },

    -- Flash
    FlashLabel = { fg = p.bright_green, bg = p.bg, bold = true },
    FlashBackdrop = { fg = p.gray4 },
    FlashMatch = { fg = p.bright_purple, bg = p.bg },
    FlashCurrent = { fg = p.bright_cyan, bg = p.bg },

    -- Lazy
    LazyDimmed = { fg = p.subtext1 },

    -- -- Noice
    -- NoiceCmdlinePopup = { bg = p.bg_dark },
    -- NoiceCmdlinePopupBorder = { fg = p.gray4 },
    -- NoiceCmdlinePopupTitle = { fg = p.blue },
    -- NoiceCmdlineIcon = { fg = p.blue },
}

function M.setup()
    load_highlights(M.highlights)
    if config.terminal_colors then
        terminal.setup()
    end
end

return M
