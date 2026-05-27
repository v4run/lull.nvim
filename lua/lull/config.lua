-- lull.nvim — configuration
local M = {}

---@class LullConfig
M.defaults = {
  -- "dark" | "light" | "auto"
  -- "auto" follows vim.o.background (the default Neovim mechanism).
  style = "auto",

  -- Drop all editor backgrounds (Normal, NormalFloat, SignColumn, ...).
  -- Useful for terminal users with translucent backgrounds.
  transparent = false,

  -- Render inactive windows with a dimmer background.
  dim_inactive = false,

  -- Italics — defaults reflect the calm aesthetic.
  italic_comments = true,
  italic_keywords = false,
  italic_booleans = false,
  italic_functions = false,

  -- Bold for keywords and titles (kept off for lull's quiet feel).
  bold_keywords = false,

  -- Set the 16 ANSI terminal colors (g:terminal_color_0..15).
  terminal_colors = true,

  -- Per-plugin integrations. Set any to `false` to skip its highlights.
  plugins = {
    telescope        = true,
    neo_tree         = true,
    nvim_tree        = true,
    gitsigns         = true,
    which_key        = true,
    nvim_cmp         = true,
    blink_cmp        = true,
    noice            = true,
    mini             = true,
    render_markdown  = true,
    snacks           = true,
    treesitter_context = true,
    indent_blankline = true,
    flash            = true,
    trouble          = true,
    lazy             = true,
    mason            = true,
  },

  -- Override individual palette colors. Keys match `lua/lull/palette.lua`.
  -- Example: palette = { dark = { bg = "#1c1f25" }, light = { fg = "#3f3d36" } }
  palette = {
    dark = {},
    light = {},
  },

  -- Override or add highlight groups after the theme is applied.
  -- Receives the resolved palette `p` and must return a `{ Group = { ... } }` table.
  -- Example:
  --   on_highlights = function(p, hl)
  --     hl.Comment = { fg = p.fg_subtle, italic = true }
  --   end
  ---@type fun(palette: table, highlights: table)|nil
  on_highlights = nil,
}

-- Active, merged config (filled by setup()).
M.options = vim.deepcopy(M.defaults)

local function deep_merge(dst, src)
  for k, v in pairs(src) do
    if type(v) == "table" and type(dst[k]) == "table" then
      deep_merge(dst[k], v)
    else
      dst[k] = v
    end
  end
  return dst
end

---@param user LullConfig|nil
function M.setup(user)
  M.options = vim.deepcopy(M.defaults)
  if user then deep_merge(M.options, user) end
  return M.options
end

---@return "dark"|"light"
function M.resolve_style()
  local s = M.options.style
  if s == "dark" or s == "light" then return s end
  return vim.o.background == "light" and "light" or "dark"
end

return M
