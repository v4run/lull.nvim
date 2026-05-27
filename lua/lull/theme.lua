-- lull.nvim — theme assembler.
-- Resolves the palette, gathers all highlight groups, applies them, and
-- exposes a `terminal()` helper for g:terminal_color_0..15.

local M = {}

local NS = "lull"  -- highlight namespace (vim.api.nvim_create_namespace)

local function load_group(name)
  return require("lull.groups." .. name)
end

---@param p table palette
---@param style "dark"|"light"
local function set_terminal_colors(p, style)
  -- ANSI 0..15 — keep close to the editor palette so terminal output reads
  -- as part of the same scene rather than a contrasting pop-out.
  if style == "dark" then
    vim.g.terminal_color_0  = "#2a2d36" -- black (slightly lifted from bg)
    vim.g.terminal_color_1  = p.error
    vim.g.terminal_color_2  = p.sage
    vim.g.terminal_color_3  = p.amber
    vim.g.terminal_color_4  = p.slate
    vim.g.terminal_color_5  = p.mauve
    vim.g.terminal_color_6  = p.teal
    vim.g.terminal_color_7  = p.fg_alt
    vim.g.terminal_color_8  = p.fg_subtle
    vim.g.terminal_color_9  = p.rose
    vim.g.terminal_color_10 = "#a8c4a8"
    vim.g.terminal_color_11 = "#e0c498"
    vim.g.terminal_color_12 = "#9eb4c8"
    vim.g.terminal_color_13 = "#c8aac8"
    vim.g.terminal_color_14 = "#9ec0b8"
    vim.g.terminal_color_15 = p.fg
  else
    vim.g.terminal_color_0  = "#d8d5cc"
    vim.g.terminal_color_1  = p.error
    vim.g.terminal_color_2  = p.sage
    vim.g.terminal_color_3  = p.amber
    vim.g.terminal_color_4  = p.slate
    vim.g.terminal_color_5  = p.mauve
    vim.g.terminal_color_6  = p.teal
    vim.g.terminal_color_7  = p.fg
    vim.g.terminal_color_8  = p.fg_mute
    vim.g.terminal_color_9  = p.rose
    vim.g.terminal_color_10 = "#6a8a6a"
    vim.g.terminal_color_11 = "#b08a48"
    vim.g.terminal_color_12 = "#5a7894"
    vim.g.terminal_color_13 = "#906890"
    vim.g.terminal_color_14 = "#5a908a"
    vim.g.terminal_color_15 = p.fg_alt
  end
end

---@param style "dark"|"light"|nil  -- if nil, resolved from config
function M.load(style)
  local config = require("lull.config")
  local cfg = config.options

  style = style or config.resolve_style()
  vim.o.background = style

  if vim.g.colors_name then pcall(vim.cmd, "hi clear") end
  if vim.fn.exists("syntax_on") == 1 then pcall(vim.cmd, "syntax reset") end

  vim.g.colors_name = "lull"
  vim.o.termguicolors = true

  -- Resolve palette + user overrides
  local palette_mod = require("lull.palette")
  local user_overrides = (cfg.palette or {})[style] or {}
  local p = palette_mod.get(style, user_overrides)

  -- Gather highlight groups
  local hl = {}
  local function merge(t)
    for k, v in pairs(t) do hl[k] = v end
  end

  merge(load_group("editor").get(p, cfg))
  merge(load_group("syntax").get(p, cfg))
  merge(load_group("treesitter").get(p, cfg))
  merge(load_group("lsp").get(p, cfg))
  merge(load_group("diagnostics").get(p, cfg))
  merge(load_group("plugins").get(p, cfg))

  -- User override hook
  if type(cfg.on_highlights) == "function" then
    cfg.on_highlights(p, hl)
  end

  -- Apply via the modern API on a named namespace, then make it the global
  -- default. This is friendlier to plugins that want to reset the global
  -- namespace without nuking us, and lets advanced users inspect via
  -- :hi(0, ...) vs :hi(ns, ...).
  local ns = vim.api.nvim_create_namespace(NS)

  -- Clear both namespaces first
  vim.api.nvim_set_hl_ns(0)
  for name, _ in pairs(hl) do
    -- defensive: drop any prior definition so undefined fields aren't sticky
    pcall(vim.api.nvim_set_hl, 0, name, {})
  end

  for group, spec in pairs(hl) do
    vim.api.nvim_set_hl(0, group, spec)
    vim.api.nvim_set_hl(ns, group, spec)
  end

  -- Make our namespace the active one for new windows (no-op for global
  -- consumers, but lets `nvim_win_set_hl_ns(win, ns)` opt windows in.)
  vim.api.nvim_set_hl_ns(ns)
  M.ns = ns

  -- vim.hl.priorities — bump treesitter so it wins over plain syntax, and
  -- keep diagnostics above semantic tokens so squiggles stay visible.
  if vim.hl and vim.hl.priorities then
    vim.hl.priorities.semantic_tokens = vim.hl.priorities.semantic_tokens or 125
    vim.hl.priorities.treesitter      = vim.hl.priorities.treesitter or 100
    vim.hl.priorities.diagnostics     = vim.hl.priorities.diagnostics or 200
  end

  if cfg.terminal_colors then
    set_terminal_colors(p, style)
  end

  -- Expose the resolved palette for downstream consumers (lualine, etc.)
  M.palette = p
  M.style = style
end

---Return the resolved palette without (re)applying highlights.
---@param style "dark"|"light"|nil
function M.colors(style)
  local config = require("lull.config")
  style = style or config.resolve_style()
  local overrides = (config.options.palette or {})[style] or {}
  return require("lull.palette").get(style, overrides)
end

return M
