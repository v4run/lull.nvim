-- Headless smoke test:  nvim --headless -u NONE -c "luafile tests/check.lua"
-- Loads every variant, checks the Normal background, and verifies every
-- foreground token clears its contrast target against the variant's bg.

vim.opt.rtp:prepend(vim.fn.getcwd())

local function lum(hex)
  local c = {}
  for i = 1, 3 do
    local v = tonumber(hex:sub(i * 2, i * 2 + 1), 16) / 255
    c[i] = v <= 0.03928 and v / 12.92 or ((v + 0.055) / 1.055) ^ 2.4
  end
  return 0.2126 * c[1] + 0.7152 * c[2] + 0.0722 * c[3]
end

local function contrast(a, b)
  local la, lb = lum(a), lum(b)
  local hi, lo = math.max(la, lb), math.min(la, lb)
  return (hi + 0.05) / (lo + 0.05)
end

local failures = 0
local function check(cond, msg)
  if not cond then
    failures = failures + 1
    io.stderr:write("FAIL: " .. msg .. "\n")
  end
end

local expected_bg = { dark = "#1e2128", light = "#f2efe8", black = "#000000" }
-- Minimum contrast for tokens that carry code (comments are allowed lower).
-- dark/light are deliberately low-contrast, so only black has hard targets.
local targets = {
  black = { code = 7.0, comment = 4.5 },
}
local code_tokens = { "fg", "fg_alt", "sage", "rose", "amber", "slate", "mauve",
  "olive", "teal", "rust", "error", "warn", "info", "hint" }

for _, style in ipairs({ "dark", "light", "black" }) do
  require("lull").setup({ style = style })
  local ok, err = pcall(vim.cmd.colorscheme, "lull")
  check(ok, style .. ": colorscheme failed: " .. tostring(err))

  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local bg = normal.bg and string.format("#%06x", normal.bg) or "nil"
  check(bg == expected_bg[style], style .. ": Normal bg " .. bg .. " ~= " .. expected_bg[style])

  local p = require("lull").colors(style)
  if targets[style] then
    for _, tok in ipairs(code_tokens) do
      local cr = contrast(p[tok], p.bg)
      check(cr >= targets[style].code,
        string.format("%s: %s %s is %.1f:1 (< %.1f)", style, tok, p[tok], cr, targets[style].code))
    end
    local cr = contrast(p.comment, p.bg)
    check(cr >= targets[style].comment,
      string.format("%s: comment %s is %.1f:1 (< %.1f)", style, p.comment, cr, targets[style].comment))
  end

  -- treesitter capture must resolve to a palette accent
  local fn = vim.api.nvim_get_hl(0, { name = "@function", link = false })
  check(fn.fg ~= nil, style .. ": @function has no fg")

  -- lualine theme resolves without error
  local lok = pcall(require("lull").lualine, style)
  check(lok, style .. ": lualine theme failed")
end

-- :colorscheme lull-black entry point
require("lull").setup({})
local ok = pcall(vim.cmd.colorscheme, "lull-black")
check(ok, "colorscheme lull-black failed")
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
check(normal.bg == 0, "lull-black: Normal bg is not #000000")
check(vim.g.colors_name == "lull-black", "lull-black: colors_name is " .. tostring(vim.g.colors_name))
-- colors() / lualine() follow the loaded variant even though config says "auto"
check(require("lull").colors().bg == "#000000", "lull-black: colors() did not follow loaded style")
check(require("lull").lualine().normal.a.fg == "#000000", "lull-black: lualine() did not follow loaded style")

if failures > 0 then
  io.stderr:write(failures .. " failure(s)\n")
  vim.cmd("cquit 1")
end
print("all checks passed")
vim.cmd("qa!")
