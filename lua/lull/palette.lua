-- lull.nvim — palette
-- Muted, desaturated tones inspired by overcast skies, soft linen, and quiet water.
-- No pure black, no pure white. Warm undertones throughout.
-- (The `black` variant is the deliberate exception: pure #000000 for OLED /
-- high-contrast use, with the same hue families turned up bright.)

local M = {}

-- =========================================================================
-- Dark variant — warm charcoal background, soft parchment foreground
-- =========================================================================
M.dark = {
  -- Surfaces
  bg          = "#1e2128", -- editor background (warm charcoal)
  bg_alt      = "#22252d", -- sidebar / inactive splits
  bg_float    = "#262932", -- floating windows
  bg_popup    = "#2a2d36", -- popup menus
  bg_sel      = "#2d313b", -- visual selection / cursorline pop
  bg_cursor   = "#2a2e37", -- cursor line
  bg_search   = "#4a4838", -- search match (muted amber wash)
  bg_match    = "#3a3d47", -- matched paren
  bg_inactive = "#1a1d23", -- dim_inactive overlay

  -- Foreground
  fg          = "#c8c4bb", -- primary code (soft parchment)
  fg_alt      = "#b6b2a8", -- secondary foreground
  fg_dim      = "#9a978f", -- tertiary / hints
  fg_mute     = "#7a7770", -- muted UI text
  fg_subtle   = "#5d5b54", -- very faded — line numbers, etc.

  -- Comments & non-text
  comment     = "#6b6960", -- noticeably faded but readable
  comment_doc = "#7c7a70", -- doc comments lift slightly
  nontext     = "#3a3d45", -- listchars, endofbuffer
  border      = "#3a3d45",
  border_lift = "#4a4d57",

  -- Accents (dusty / muted — never neon)
  sage        = "#9bb89b", -- functions (a touch brighter than fg)
  sage_dim    = "#7e9a7e",
  rose        = "#c89b9b", -- constants, numbers (dusty rose)
  rose_dim    = "#a87e7e",
  amber       = "#d4b483", -- strings (warm faded amber)
  amber_dim   = "#b09569",
  slate       = "#8aa0b8", -- keywords (slate blue)
  slate_dim   = "#6f8499",
  mauve       = "#b89bb8", -- types (soft mauve)
  mauve_dim   = "#9a809a",
  olive       = "#c4b582", -- attributes / fields warm
  teal        = "#8ab0a8", -- special / regex (quiet water)
  rust        = "#b88a78", -- operators / punctuation accent

  -- Diagnostics (noticeable but not alarming)
  error       = "#c87a7a",
  warn        = "#d4a574",
  info        = "#8aa8b8",
  hint        = "#8ba888",
  ok          = "#8ba888",

  -- Diagnostic backgrounds (very subtle washes)
  error_bg    = "#3a2a2a",
  warn_bg     = "#3a3024",
  info_bg     = "#243038",
  hint_bg     = "#2a3528",

  -- Git / diff
  diff_add    = "#2c3a2c",
  diff_change = "#2a3340",
  diff_delete = "#3a2a2a",
  diff_text   = "#3a4a3a",
  git_add     = "#8ba888",
  git_change  = "#8aa0b8",
  git_delete  = "#c87a7a",

  -- None
  none        = "NONE",
}

-- =========================================================================
-- Light variant — warm linen background, soft graphite foreground
-- =========================================================================
M.light = {
  -- Surfaces
  bg          = "#f2efe8", -- warm linen
  bg_alt      = "#ebe8e0",
  bg_float    = "#e8e5dc",
  bg_popup    = "#e2dfd6",
  bg_sel      = "#ddd9cf",
  bg_cursor   = "#e8e5db",
  bg_search   = "#e8d8a8",
  bg_match    = "#d8d4c8",
  bg_inactive = "#ece9e1",

  -- Foreground
  fg          = "#4a4842", -- soft graphite
  fg_alt      = "#5a5851",
  fg_dim      = "#7a786f",
  fg_mute     = "#94928a",
  fg_subtle   = "#b4b2a8",

  -- Comments & non-text
  comment     = "#9a988e",
  comment_doc = "#85837a",
  nontext     = "#cbc8be",
  border      = "#c4c1b7",
  border_lift = "#b0ad9f",

  -- Accents — desaturated, slightly deeper for legibility on light bg
  sage        = "#5a7a5a",
  sage_dim    = "#728a72",
  rose        = "#a06868",
  rose_dim    = "#b07a7a",
  amber       = "#a07840",
  amber_dim   = "#b48a55",
  slate       = "#4a6880",
  slate_dim   = "#647e94",
  mauve       = "#805880",
  mauve_dim   = "#94709a",
  olive       = "#807040",
  teal        = "#4a8077",
  rust        = "#955a45",

  -- Diagnostics
  error       = "#a85050",
  warn        = "#a07028",
  info        = "#4a6880",
  hint        = "#5a7a5a",
  ok          = "#5a7a5a",

  error_bg    = "#f0dcd8",
  warn_bg     = "#f0e4cc",
  info_bg     = "#dce4ec",
  hint_bg     = "#dde8d8",

  diff_add    = "#dde8d8",
  diff_change = "#dce4ec",
  diff_delete = "#f0dcd8",
  diff_text   = "#cad8c4",
  git_add     = "#5a7a5a",
  git_change  = "#4a6880",
  git_delete  = "#a85050",

  none        = "NONE",
}

-- =========================================================================
-- Black variant — pure black background, bright high-contrast accents.
-- Same hue families as dark, lifted so every accent clears 7:1 (WCAG AAA)
-- against #000000. Comments sit at ~4.8:1 so they recede without vanishing.
-- =========================================================================
M.black = {
  -- Surfaces (a near-black ladder so floats/popups still separate from bg)
  bg          = "#000000", -- editor background (pure black)
  bg_alt      = "#0a0a0a", -- sidebar / inactive splits
  bg_float    = "#101010", -- floating windows
  bg_popup    = "#161616", -- popup menus
  bg_sel      = "#1e1e1e", -- visual selection
  bg_cursor   = "#0c0c0c", -- cursor line
  bg_search   = "#3d3410", -- search match (amber wash)
  bg_match    = "#2a2a2a", -- matched paren
  bg_inactive = "#000000", -- dim_inactive overlay (already at the floor)

  -- Foreground
  fg          = "#e8e6e3", -- primary code (16.9:1)
  fg_alt      = "#d0cec9", -- secondary foreground
  fg_dim      = "#a8a6a0", -- tertiary / hints
  fg_mute     = "#8a8880", -- muted UI text
  fg_subtle   = "#5c5b57", -- very faded — line numbers, etc.

  -- Comments & non-text
  comment     = "#7a7872", -- 4.8:1 — faded but readable
  comment_doc = "#8e8c85", -- doc comments lift slightly
  nontext     = "#2a2a2a", -- listchars, endofbuffer
  border      = "#262626",
  border_lift = "#363636",

  -- Accents (bright, saturated — all >= 10:1 on black)
  sage        = "#8fe0a0", -- functions
  sage_dim    = "#6fbf80",
  rose        = "#ff9bb0", -- constants, numbers
  rose_dim    = "#d97d92",
  amber       = "#ffcf7a", -- strings
  amber_dim   = "#d9ad5c",
  slate       = "#8ec8ff", -- keywords
  slate_dim   = "#6fa8df",
  mauve       = "#d9a8ff", -- types
  mauve_dim   = "#b88adf",
  olive       = "#e0d080", -- attributes / fields
  teal        = "#7ee8dc", -- special / regex
  rust        = "#ffa070", -- operators / return / self

  -- Diagnostics
  error       = "#ff6b6b",
  warn        = "#ffb347",
  info        = "#6cc8ff",
  hint        = "#8fe0a0",
  ok          = "#8fe0a0",

  -- Diagnostic backgrounds (dark tinted washes)
  error_bg    = "#2a0e0e",
  warn_bg     = "#2a1e08",
  info_bg     = "#0a1a2a",
  hint_bg     = "#0c2212",

  -- Git / diff
  diff_add    = "#0c1f10",
  diff_change = "#0c1626",
  diff_delete = "#240c0c",
  diff_text   = "#16341c",
  git_add     = "#8fe0a0",
  git_change  = "#8ec8ff",
  git_delete  = "#ff6b6b",

  -- None
  none        = "NONE",
}

-- Resolve a palette by name, with optional user overrides.
---@param name "dark"|"light"|"black"
---@param overrides table|nil  -- merged on top of the base palette
function M.get(name, overrides)
  local base = M[name] or M.dark
  local out = {}
  for k, v in pairs(base) do out[k] = v end
  if overrides then
    for k, v in pairs(overrides) do out[k] = v end
  end
  return out
end

return M
