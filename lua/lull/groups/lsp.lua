-- lull.nvim — LSP semantic tokens (@lsp.type.* and @lsp.mod.*)
-- Modern Neovim layers these on top of treesitter; we mostly mirror our
-- treesitter palette so transitions are seamless.
local M = {}

function M.get(p, cfg)
  return {
    -- Core LSP UI groups ---------------------------------------------------
    LspReferenceText      = { bg = p.bg_match },
    LspReferenceRead      = { bg = p.bg_match },
    LspReferenceWrite     = { bg = p.bg_match, underline = true },
    LspReferenceTarget    = { bg = p.bg_match },

    LspSignatureActiveParameter = { fg = p.amber, bold = true, underline = true },
    LspCodeLens           = { fg = p.fg_subtle, italic = true },
    LspCodeLensSeparator  = { fg = p.fg_subtle },
    LspInlayHint          = { fg = p.fg_subtle, bg = p.bg_alt, italic = true },

    LspInfoBorder         = { fg = p.border_lift, bg = p.bg_float },

    -- Semantic token types -------------------------------------------------
    ["@lsp.type.namespace"]      = { fg = p.fg_alt },
    ["@lsp.type.type"]           = { fg = p.mauve },
    ["@lsp.type.class"]          = { fg = p.mauve },
    ["@lsp.type.enum"]           = { fg = p.mauve },
    ["@lsp.type.interface"]      = { fg = p.mauve },
    ["@lsp.type.struct"]         = { fg = p.mauve },
    ["@lsp.type.typeParameter"]  = { fg = p.mauve, italic = true },

    ["@lsp.type.parameter"]      = { fg = p.fg, italic = true },
    ["@lsp.type.variable"]       = { fg = p.fg },
    ["@lsp.type.property"]       = { fg = p.olive },
    ["@lsp.type.enumMember"]     = { fg = p.rose },
    ["@lsp.type.event"]          = { fg = p.teal },
    ["@lsp.type.function"]       = { fg = p.sage },
    ["@lsp.type.method"]         = { fg = p.sage },
    ["@lsp.type.macro"]          = { fg = p.mauve },
    ["@lsp.type.keyword"]        = { fg = p.slate, italic = cfg.italic_keywords },
    ["@lsp.type.modifier"]       = { fg = p.slate },
    ["@lsp.type.comment"]        = {}, -- defer to treesitter @comment
    ["@lsp.type.string"]         = {}, -- defer to treesitter @string
    ["@lsp.type.number"]         = { fg = p.rose },
    ["@lsp.type.regexp"]         = { fg = p.teal },
    ["@lsp.type.operator"]       = { fg = p.fg_alt },
    ["@lsp.type.decorator"]      = { fg = p.olive },
    ["@lsp.type.selfParameter"]  = { fg = p.rust, italic = true },
    ["@lsp.type.builtinType"]    = { fg = p.mauve, italic = true },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = p.error },

    -- Semantic modifiers ---------------------------------------------------
    ["@lsp.mod.readonly"]        = { italic = true },
    ["@lsp.mod.constant"]        = { fg = p.rose },
    ["@lsp.mod.static"]          = { italic = true },
    ["@lsp.mod.deprecated"]      = { strikethrough = true, fg = p.fg_dim },
    ["@lsp.mod.documentation"]   = { fg = p.comment_doc },
    ["@lsp.mod.defaultLibrary"]  = { italic = true },

    -- Common typemod combinations (more specific than mods alone) ----------
    ["@lsp.typemod.variable.readonly"]     = { fg = p.rose },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = p.rust, italic = true },
    ["@lsp.typemod.parameter.readonly"]    = { fg = p.fg, italic = true },
    ["@lsp.typemod.property.readonly"]     = { fg = p.olive },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = p.sage, italic = true },
    ["@lsp.typemod.method.defaultLibrary"] = { fg = p.sage, italic = true },
    ["@lsp.typemod.type.defaultLibrary"]   = { fg = p.mauve, italic = true },
    ["@lsp.typemod.class.defaultLibrary"]  = { fg = p.mauve, italic = true },
    ["@lsp.typemod.keyword.controlFlow"]   = { fg = p.rust, italic = cfg.italic_keywords },
    ["@lsp.typemod.keyword.async"]         = { fg = p.mauve, italic = true },
    ["@lsp.typemod.string.escape"]         = { fg = p.teal, bold = true },
    ["@lsp.typemod.operator.injected"]     = { fg = p.fg_alt },
    ["@lsp.typemod.variable.injected"]     = { fg = p.fg },
  }
end

return M
