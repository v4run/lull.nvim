-- lull.nvim — public entry point.
-- Canonical usage:
--   require("lull").setup({ style = "auto", italic_comments = true, ... })
--   vim.cmd.colorscheme("lull")

local M = {}

---@param user table|nil  -- see lua/lull/config.lua for all options
function M.setup(user)
  require("lull.config").setup(user)
end

---Apply the theme. Honors the active config; an explicit `style` overrides.
---@param style "dark"|"light"|nil
function M.load(style)
  require("lull.theme").load(style)
end

---Resolved palette for the currently active style. Useful for statusline
---authors who want to read lull's tokens without applying highlights.
---@param style "dark"|"light"|nil
function M.colors(style)
  return require("lull.theme").colors(style)
end

---Lualine theme table. Pass to `options.theme`.
---@param style "dark"|"light"|nil
function M.lualine(style)
  if style then return require("lull.lualine").theme(style) end
  return require("lull.lualine")
end

return M
