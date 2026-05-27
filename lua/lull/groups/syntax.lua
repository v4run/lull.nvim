-- lull.nvim — classic vim syntax groups (the :h group-name list).
-- These are the fallback for filetypes without treesitter.
local M = {}

function M.get(p, cfg)
  return {
    -- Comments
    Comment      = { fg = p.comment, italic = cfg.italic_comments },

    -- Constants
    Constant     = { fg = p.rose },
    String       = { fg = p.amber },
    Character    = { fg = p.amber },
    Number       = { fg = p.rose },
    Float        = { fg = p.rose },
    Boolean      = { fg = p.rose, italic = cfg.italic_booleans },

    -- Identifiers
    Identifier   = { fg = p.fg },
    Function     = { fg = p.sage, italic = cfg.italic_functions },

    -- Statements / keywords
    Statement    = { fg = p.slate },
    Conditional  = { fg = p.slate, italic = cfg.italic_keywords },
    Repeat       = { fg = p.slate, italic = cfg.italic_keywords },
    Label        = { fg = p.slate },
    Operator     = { fg = p.fg_alt },
    Keyword      = { fg = p.slate, italic = cfg.italic_keywords, bold = cfg.bold_keywords },
    Exception    = { fg = p.rust },

    -- Preprocessor
    PreProc      = { fg = p.mauve },
    Include      = { fg = p.mauve },
    Define       = { fg = p.mauve },
    Macro        = { fg = p.mauve },
    PreCondit    = { fg = p.mauve },

    -- Types
    Type         = { fg = p.mauve },
    StorageClass = { fg = p.slate },
    Structure    = { fg = p.mauve },
    Typedef      = { fg = p.mauve },

    -- Special
    Special      = { fg = p.teal },
    SpecialChar  = { fg = p.teal },
    Tag          = { fg = p.slate },
    Delimiter    = { fg = p.fg_alt },
    SpecialComment = { fg = p.comment_doc, italic = cfg.italic_comments, bold = true },

    -- Underline / misc
    Underlined   = { fg = p.slate, underline = true },
    Bold         = { bold = true },
    Italic       = { italic = true },
    Ignore       = { fg = p.fg_subtle },

    -- Markdown-ish (vim's built-in syntax — treesitter adds @markup.*)
    htmlH1       = { fg = p.fg, bold = true },
    htmlH2       = { fg = p.fg, bold = true },
    htmlH3       = { fg = p.fg_alt, bold = true },
    htmlH4       = { fg = p.fg_alt, bold = true },
    htmlLink     = { fg = p.slate, underline = true },
    htmlBold     = { fg = p.fg, bold = true },
    htmlItalic   = { fg = p.fg, italic = true },
  }
end

return M
