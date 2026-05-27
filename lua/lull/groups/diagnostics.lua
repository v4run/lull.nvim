-- lull.nvim — diagnostics (modern Neovim diagnostic groups)
-- Undercurl underlines for inline squiggles — noticeable, not alarming.
local M = {}

function M.get(p, _cfg)
  return {
    -- Text in buffer / virtual text
    DiagnosticError = { fg = p.error },
    DiagnosticWarn  = { fg = p.warn },
    DiagnosticInfo  = { fg = p.info },
    DiagnosticHint  = { fg = p.hint },
    DiagnosticOk    = { fg = p.ok },

    -- Virtual text (eol)
    DiagnosticVirtualTextError = { fg = p.error, bg = p.error_bg, italic = true },
    DiagnosticVirtualTextWarn  = { fg = p.warn,  bg = p.warn_bg,  italic = true },
    DiagnosticVirtualTextInfo  = { fg = p.info,  bg = p.info_bg,  italic = true },
    DiagnosticVirtualTextHint  = { fg = p.hint,  bg = p.hint_bg,  italic = true },
    DiagnosticVirtualTextOk    = { fg = p.ok,    bg = p.hint_bg,  italic = true },

    -- Virtual lines (nvim 0.10+)
    DiagnosticVirtualLinesError = { fg = p.error, bg = p.error_bg },
    DiagnosticVirtualLinesWarn  = { fg = p.warn,  bg = p.warn_bg },
    DiagnosticVirtualLinesInfo  = { fg = p.info,  bg = p.info_bg },
    DiagnosticVirtualLinesHint  = { fg = p.hint,  bg = p.hint_bg },
    DiagnosticVirtualLinesOk    = { fg = p.ok,    bg = p.hint_bg },

    -- Underlines — undercurl, color via sp= (modern style)
    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.warn },
    DiagnosticUnderlineInfo  = { underline = true, sp = p.info },
    DiagnosticUnderlineHint  = { underline = true, sp = p.hint },
    DiagnosticUnderlineOk    = { underline = true, sp = p.ok },

    -- Floating window
    DiagnosticFloatingError = { fg = p.error, bg = p.bg_float },
    DiagnosticFloatingWarn  = { fg = p.warn,  bg = p.bg_float },
    DiagnosticFloatingInfo  = { fg = p.info,  bg = p.bg_float },
    DiagnosticFloatingHint  = { fg = p.hint,  bg = p.bg_float },
    DiagnosticFloatingOk    = { fg = p.ok,    bg = p.bg_float },

    -- Signs (gutter)
    DiagnosticSignError = { fg = p.error },
    DiagnosticSignWarn  = { fg = p.warn },
    DiagnosticSignInfo  = { fg = p.info },
    DiagnosticSignHint  = { fg = p.hint },
    DiagnosticSignOk    = { fg = p.ok },

    -- Deprecation / unnecessary
    DiagnosticDeprecated  = { fg = p.fg_dim, strikethrough = true, sp = p.fg_dim },
    DiagnosticUnnecessary = { fg = p.fg_subtle, italic = true },
  }
end

return M
