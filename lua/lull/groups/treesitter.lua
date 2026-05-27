-- lull.nvim — Treesitter capture groups (modern @captures).
-- See `:h treesitter-highlight-groups` and nvim-treesitter docs.
local M = {}

function M.get(p, cfg)
  return {
    -- Identifiers ----------------------------------------------------------
    ["@variable"]                = { fg = p.fg },
    ["@variable.builtin"]        = { fg = p.rust, italic = true },
    ["@variable.parameter"]      = { fg = p.fg, italic = true },
    ["@variable.parameter.builtin"] = { fg = p.rust, italic = true },
    ["@variable.member"]         = { fg = p.olive },

    ["@constant"]                = { fg = p.rose },
    ["@constant.builtin"]        = { fg = p.rose, italic = true },
    ["@constant.macro"]          = { fg = p.mauve },

    ["@module"]                  = { fg = p.fg_alt },
    ["@module.builtin"]          = { fg = p.rust, italic = true },
    ["@label"]                   = { fg = p.slate },

    -- Literals -------------------------------------------------------------
    ["@string"]                  = { fg = p.amber },
    ["@string.documentation"]    = { fg = p.comment_doc, italic = true },
    ["@string.regexp"]           = { fg = p.teal },
    ["@string.escape"]           = { fg = p.teal, bold = true },
    ["@string.special"]          = { fg = p.teal },
    ["@string.special.symbol"]   = { fg = p.rose },
    ["@string.special.url"]      = { fg = p.slate, underline = true },
    ["@string.special.path"]     = { fg = p.slate, underline = true },

    ["@character"]               = { fg = p.amber },
    ["@character.special"]       = { fg = p.teal },

    ["@boolean"]                 = { fg = p.rose, italic = cfg.italic_booleans },
    ["@number"]                  = { fg = p.rose },
    ["@number.float"]            = { fg = p.rose },

    -- Types ----------------------------------------------------------------
    ["@type"]                    = { fg = p.mauve },
    ["@type.builtin"]            = { fg = p.mauve, italic = true },
    ["@type.definition"]         = { fg = p.mauve, bold = true },
    ["@type.qualifier"]          = { fg = p.slate, italic = cfg.italic_keywords },

    ["@attribute"]               = { fg = p.olive },
    ["@attribute.builtin"]       = { fg = p.olive, italic = true },
    ["@property"]                = { fg = p.olive },

    -- Functions ------------------------------------------------------------
    ["@function"]                = { fg = p.sage, italic = cfg.italic_functions },
    ["@function.builtin"]        = { fg = p.sage, italic = true },
    ["@function.call"]           = { fg = p.sage },
    ["@function.macro"]          = { fg = p.mauve },
    ["@function.method"]         = { fg = p.sage },
    ["@function.method.call"]    = { fg = p.sage },

    ["@constructor"]             = { fg = p.mauve },
    ["@operator"]                = { fg = p.fg_alt },

    -- Keywords -------------------------------------------------------------
    ["@keyword"]                 = { fg = p.slate, italic = cfg.italic_keywords, bold = cfg.bold_keywords },
    ["@keyword.coroutine"]       = { fg = p.slate, italic = true },
    ["@keyword.function"]        = { fg = p.slate, italic = cfg.italic_keywords },
    ["@keyword.operator"]        = { fg = p.slate },
    ["@keyword.import"]          = { fg = p.mauve },
    ["@keyword.type"]            = { fg = p.slate },
    ["@keyword.modifier"]        = { fg = p.slate },
    ["@keyword.repeat"]          = { fg = p.slate, italic = cfg.italic_keywords },
    ["@keyword.return"]          = { fg = p.rust, italic = cfg.italic_keywords },
    ["@keyword.debug"]           = { fg = p.rust },
    ["@keyword.exception"]       = { fg = p.rust, italic = cfg.italic_keywords },

    ["@keyword.conditional"]     = { fg = p.slate, italic = cfg.italic_keywords },
    ["@keyword.conditional.ternary"] = { fg = p.fg_alt },

    ["@keyword.directive"]       = { fg = p.mauve },
    ["@keyword.directive.define"] = { fg = p.mauve },

    -- Punctuation ----------------------------------------------------------
    ["@punctuation.delimiter"]   = { fg = p.fg_mute },
    ["@punctuation.bracket"]     = { fg = p.fg_alt },
    ["@punctuation.special"]     = { fg = p.teal },

    -- Comments -------------------------------------------------------------
    ["@comment"]                 = { fg = p.comment, italic = cfg.italic_comments },
    ["@comment.documentation"]   = { fg = p.comment_doc, italic = cfg.italic_comments },
    ["@comment.error"]           = { fg = p.error, bold = true },
    ["@comment.warning"]         = { fg = p.warn, bold = true },
    ["@comment.todo"]            = { fg = p.amber, bold = true },
    ["@comment.note"]            = { fg = p.info, bold = true },

    -- Markup (markdown, etc.) ---------------------------------------------
    ["@markup"]                  = { fg = p.fg },
    ["@markup.strong"]           = { fg = p.fg, bold = true },
    ["@markup.italic"]           = { fg = p.fg, italic = true },
    ["@markup.strikethrough"]    = { fg = p.fg_dim, strikethrough = true },
    ["@markup.underline"]        = { fg = p.fg, underline = true },

    ["@markup.heading"]          = { fg = p.fg, bold = true },
    ["@markup.heading.1"]        = { fg = p.slate, bold = true },
    ["@markup.heading.2"]        = { fg = p.sage, bold = true },
    ["@markup.heading.3"]        = { fg = p.mauve, bold = true },
    ["@markup.heading.4"]        = { fg = p.amber, bold = true },
    ["@markup.heading.5"]        = { fg = p.rose, bold = true },
    ["@markup.heading.6"]        = { fg = p.teal, bold = true },

    ["@markup.quote"]            = { fg = p.fg_dim, italic = true },
    ["@markup.math"]             = { fg = p.teal },
    ["@markup.environment"]      = { fg = p.mauve },

    ["@markup.link"]             = { fg = p.slate },
    ["@markup.link.label"]       = { fg = p.fg_alt },
    ["@markup.link.url"]         = { fg = p.slate, underline = true },

    ["@markup.raw"]              = { fg = p.amber, bg = p.bg_alt },
    ["@markup.raw.block"]        = { fg = p.fg_alt, bg = p.bg_alt },

    ["@markup.list"]             = { fg = p.slate },
    ["@markup.list.checked"]     = { fg = p.sage },
    ["@markup.list.unchecked"]   = { fg = p.fg_dim },

    -- Diff -----------------------------------------------------------------
    ["@diff.plus"]               = { fg = p.git_add,    bg = p.diff_add },
    ["@diff.minus"]              = { fg = p.git_delete, bg = p.diff_delete },
    ["@diff.delta"]              = { fg = p.git_change, bg = p.diff_change },

    -- Tags (HTML/XML/JSX) --------------------------------------------------
    ["@tag"]                     = { fg = p.slate },
    ["@tag.builtin"]             = { fg = p.slate, italic = true },
    ["@tag.attribute"]           = { fg = p.olive },
    ["@tag.delimiter"]           = { fg = p.fg_mute },
  }
end

return M
