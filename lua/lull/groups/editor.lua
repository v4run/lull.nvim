-- lull.nvim — core editor groups (UI chrome, not syntax)
local M = {}

---@param p table palette
---@param cfg table resolved config
function M.get(p, cfg)
  local bg = cfg.transparent and p.none or p.bg

  return {
    -- Base
    Normal       = { fg = p.fg, bg = bg },
    NormalNC     = { fg = p.fg, bg = cfg.dim_inactive and p.bg_inactive or bg },
    Conceal      = { fg = p.fg_mute },
    EndOfBuffer  = { fg = p.nontext, bg = bg },
    NonText      = { fg = p.nontext },
    Whitespace   = { fg = p.nontext },
    SpecialKey   = { fg = p.fg_subtle },
    Directory    = { fg = p.slate },
    Title        = { fg = p.fg, bold = true },
    ErrorMsg     = { fg = p.error },
    WarningMsg   = { fg = p.warn },
    MoreMsg      = { fg = p.sage },
    Question     = { fg = p.slate },
    ModeMsg      = { fg = p.fg_alt, bold = true },
    MsgArea      = { fg = p.fg, bg = bg },
    MsgSeparator = { fg = p.border, bg = p.bg_float },

    -- Cursor / line
    Cursor       = { fg = p.bg, bg = p.fg },
    lCursor      = { fg = p.bg, bg = p.fg },
    CursorIM     = { fg = p.bg, bg = p.fg },
    TermCursor   = { fg = p.bg, bg = p.fg },
    TermCursorNC = { fg = p.bg, bg = p.fg_dim },
    CursorLine   = { bg = p.bg_cursor },
    CursorColumn = { bg = p.bg_cursor },
    ColorColumn  = { bg = p.bg_alt },

    -- Line numbers / signs
    LineNr       = { fg = p.fg_subtle, bg = bg },
    LineNrAbove  = { fg = p.fg_subtle, bg = bg },
    LineNrBelow  = { fg = p.fg_subtle, bg = bg },
    CursorLineNr = { fg = p.fg_alt, bg = p.bg_cursor, bold = true },
    SignColumn   = { fg = p.fg_mute, bg = bg },
    FoldColumn   = { fg = p.fg_subtle, bg = bg },
    Folded       = { fg = p.fg_dim, bg = p.bg_alt },

    -- Splits & windows
    WinSeparator = { fg = p.border, bg = bg },
    VertSplit    = { fg = p.border, bg = bg }, -- legacy alias
    WinBar       = { fg = p.fg_alt, bg = bg, bold = true },
    WinBarNC     = { fg = p.fg_mute, bg = bg },

    -- Statusline / tabline
    StatusLine   = { fg = p.fg_alt, bg = p.bg_alt },
    StatusLineNC = { fg = p.fg_mute, bg = p.bg_alt },
    TabLine      = { fg = p.fg_mute, bg = p.bg_alt },
    TabLineFill  = { bg = p.bg_alt },
    TabLineSel   = { fg = p.fg, bg = bg, bold = true },

    -- Search & matches
    Search       = { fg = p.fg, bg = p.bg_search },
    IncSearch    = { fg = p.bg, bg = p.amber, bold = true },
    CurSearch    = { fg = p.bg, bg = p.amber, bold = true },
    Substitute   = { fg = p.bg, bg = p.rose },
    MatchParen   = { fg = p.amber, bg = p.bg_match, bold = true },
    QuickFixLine = { bg = p.bg_sel },

    -- Selection
    Visual       = { bg = p.bg_sel },
    VisualNOS    = { bg = p.bg_sel },

    -- Popup menu
    Pmenu        = { fg = p.fg, bg = p.bg_popup },
    PmenuSel     = { fg = p.fg, bg = p.bg_sel, bold = true },
    PmenuKind    = { fg = p.mauve, bg = p.bg_popup },
    PmenuKindSel = { fg = p.mauve, bg = p.bg_sel, bold = true },
    PmenuExtra   = { fg = p.fg_dim, bg = p.bg_popup },
    PmenuExtraSel = { fg = p.fg_dim, bg = p.bg_sel },
    PmenuSbar    = { bg = p.bg_alt },
    PmenuThumb   = { bg = p.border_lift },

    -- Floats
    NormalFloat  = { fg = p.fg, bg = p.bg_float },
    FloatBorder  = { fg = p.border_lift, bg = p.bg_float },
    FloatTitle   = { fg = p.fg, bg = p.bg_float, bold = true },
    FloatFooter  = { fg = p.fg_dim, bg = p.bg_float },

    -- Spell
    SpellBad     = { undercurl = true, sp = p.error },
    SpellCap     = { undercurl = true, sp = p.warn },
    SpellLocal   = { undercurl = true, sp = p.info },
    SpellRare    = { undercurl = true, sp = p.hint },

    -- Misc
    Error        = { fg = p.error },
    Todo         = { fg = p.amber, bg = p.bg_alt, bold = true },
    Hint         = { fg = p.hint },
    Debug        = { fg = p.rose },

    -- Diff (whole-line)
    DiffAdd      = { bg = p.diff_add },
    DiffChange   = { bg = p.diff_change },
    DiffDelete   = { fg = p.git_delete, bg = p.diff_delete },
    DiffText     = { bg = p.diff_text, bold = true },

    -- Snippet
    SnippetTabstop = { bg = p.bg_sel },
  }
end

return M
