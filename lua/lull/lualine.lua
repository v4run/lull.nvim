-- lull.nvim — lualine theme.
--
-- Three ways to wire this up:
--
--   1. By name (auto-discovered via lua/lualine/themes/lull.lua):
--        require("lualine").setup({ options = { theme = "lull" } })
--
--   2. As a table (resolves against the active lull style at call time):
--        require("lualine").setup({ options = { theme = require("lull.lualine").theme() } })
--
--   3. Pinned to a specific variant:
--        theme = require("lull.lualine").theme("dark")
--        theme = require("lull.lualine").dark
--        theme = require("lull.lualine").light
--
-- The theme reacts to your config + vim.o.background. If you toggle variants
-- at runtime, re-run :colorscheme lull (or use the ColorScheme autocmd shown
-- in the README) so lualine picks up the new colors.

local M = {}

---@param style "dark"|"light"|nil  -- nil → follows current lull config / background
function M.theme(style)
  local p = require("lull.theme").colors(style)

  local b = { fg = p.fg_alt,    bg = p.bg_alt }
  local c = { fg = p.fg_dim,    bg = p.bg }

  return {
    normal = {
      a = { fg = p.bg, bg = p.slate, gui = "bold" },
      b = b,
      c = c,
    },
    insert = {
      a = { fg = p.bg, bg = p.sage, gui = "bold" },
      b = b,
      c = c,
    },
    visual = {
      a = { fg = p.bg, bg = p.mauve, gui = "bold" },
      b = b,
      c = c,
    },
    replace = {
      a = { fg = p.bg, bg = p.rose, gui = "bold" },
      b = b,
      c = c,
    },
    command = {
      a = { fg = p.bg, bg = p.amber, gui = "bold" },
      b = b,
      c = c,
    },
    terminal = {
      a = { fg = p.bg, bg = p.teal, gui = "bold" },
      b = b,
      c = c,
    },
    inactive = {
      a = { fg = p.fg_mute,   bg = p.bg_alt },
      b = { fg = p.fg_mute,   bg = p.bg_alt },
      c = { fg = p.fg_subtle, bg = p.bg },
    },
  }
end

-- Convenience properties for callers who want a specific variant.
M.dark  = M.theme("dark")
M.light = M.theme("light")

return M
