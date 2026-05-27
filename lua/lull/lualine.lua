-- lull.nvim — lualine theme.
-- Usage:
--   require("lualine").setup({ options = { theme = require("lull.lualine") } })
-- or
--   require("lualine").setup({ options = { theme = "lull" } })  -- if you symlink

local M = {}

---@param style "dark"|"light"|nil
function M.theme(style)
  local p = require("lull.theme").colors(style)

  local normal_a   = { fg = p.bg, bg = p.slate, gui = "bold" }
  local insert_a   = { fg = p.bg, bg = p.sage,  gui = "bold" }
  local visual_a   = { fg = p.bg, bg = p.mauve, gui = "bold" }
  local replace_a  = { fg = p.bg, bg = p.rose,  gui = "bold" }
  local command_a  = { fg = p.bg, bg = p.amber, gui = "bold" }
  local terminal_a = { fg = p.bg, bg = p.teal,  gui = "bold" }
  local inactive_a = { fg = p.fg_mute, bg = p.bg_alt }

  local b = { fg = p.fg_alt, bg = p.bg_alt }
  local c = { fg = p.fg_dim, bg = p.bg }

  return {
    normal   = { a = normal_a,   b = b, c = c },
    insert   = { a = insert_a,   b = b, c = c },
    visual   = { a = visual_a,   b = b, c = c },
    replace  = { a = replace_a,  b = b, c = c },
    command  = { a = command_a,  b = b, c = c },
    terminal = { a = terminal_a, b = b, c = c },
    inactive = {
      a = inactive_a,
      b = { fg = p.fg_mute, bg = p.bg_alt },
      c = { fg = p.fg_subtle, bg = p.bg },
    },
  }
end

-- Default export: resolved for the active style at require-time.
return setmetatable(M.theme(), {
  __call = function(_, style) return M.theme(style) end,
  __index = function(_, k) return M.theme()[k] end,
})
