# lull.nvim

A quiet Neovim colorscheme designed for long sessions. Muted, desaturated tones inspired by overcast skies, soft linen, and quiet water. Low contrast but readable — nothing screams, nothing hides.

- Dark and light variants, toggled via `vim.o.background`
- Warm undertones throughout — no pure black, no pure white
- Full Treesitter coverage including newer captures (`@variable.member`, `@function.call`, `@keyword.return`, `@markup.*`, `@diff.*`, …)
- LSP semantic tokens (`@lsp.type.*`, `@lsp.mod.*`, common `@lsp.typemod.*` combinations)
- Modern diagnostic styling with `undercurl` underlines
- Plugin support: Telescope, Neo-tree, nvim-tree, Gitsigns, WhichKey, nvim-cmp, **blink.cmp**, noice.nvim, mini.nvim, render-markdown.nvim, **snacks.nvim**, treesitter-context, indent-blankline, flash.nvim, trouble.nvim, lazy.nvim, mason.nvim
- Lualine theme included
- 16-color terminal palette

## Requirements

- Neovim **0.10+** (uses `vim.api.nvim_set_hl`, `vim.hl.priorities`, undercurl with `sp=`)
- A terminal with true-color support (`termguicolors` is enabled automatically)

## Installation

### lazy.nvim

```lua
{
  "v4run/lull.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "auto",
    italic_comments = true,
  },
  config = function(_, opts)
    require("lull").setup(opts)
    vim.cmd.colorscheme("lull")
  end,
}
```

### packer.nvim

```lua
use {
  "v4run/lull.nvim",
  config = function()
    require("lull").setup({})
    vim.cmd.colorscheme("lull")
  end,
}
```

### vim-plug / built-in `:packadd`

```vim
Plug 'v4run/lull.nvim'
" then, somewhere in your init.lua:
" require("lull").setup({}); vim.cmd.colorscheme("lull")
```

## Quick start

```lua
require("lull").setup({})
vim.cmd.colorscheme("lull")
```

Switch variants at runtime by flipping `background`:

```vim
:set background=light
:set background=dark
```

…or pin the variant explicitly via `style`:

```lua
require("lull").setup({ style = "dark" })
```

## Configuration

All options are optional. The defaults live in `lua/lull/config.lua`.

```lua
require("lull").setup({
  -- "dark" | "light" | "auto" (follows vim.o.background)
  style = "auto",

  -- Drop all editor backgrounds (Normal, NormalFloat, SignColumn…). Useful for
  -- translucent terminals.
  transparent = false,

  -- Render inactive windows with a slightly dimmer background.
  dim_inactive = false,

  -- Italics
  italic_comments  = true,
  italic_keywords  = false,
  italic_booleans  = false,
  italic_functions = false,

  -- Bold for keywords (off by default — lull is meant to be quiet)
  bold_keywords = false,

  -- Set g:terminal_color_0..15 so :terminal matches the editor
  terminal_colors = true,

  -- Toggle individual plugin integrations
  plugins = {
    telescope          = true,
    neo_tree           = true,
    nvim_tree          = true,
    gitsigns           = true,
    which_key          = true,
    nvim_cmp           = true,
    blink_cmp          = true,
    noice              = true,
    mini               = true,
    render_markdown    = true,
    snacks             = true,
    treesitter_context = true,
    indent_blankline   = true,
    flash              = true,
    trouble            = true,
    lazy               = true,
    mason              = true,
  },

  -- Override individual palette colors. Keys must match `lua/lull/palette.lua`.
  palette = {
    dark = {
      -- bg = "#1c1f25",
      -- amber = "#dab98a",
    },
    light = {
      -- fg = "#3f3d36",
    },
  },

  -- Final-pass override hook. Receives the resolved palette `p` and the
  -- assembled highlight table `hl`; mutate `hl` in place.
  on_highlights = function(p, hl)
    -- hl.Comment = { fg = p.fg_subtle, italic = true }
    -- hl["@keyword.return"] = { fg = p.rust, bold = true }
  end,
})

vim.cmd.colorscheme("lull")
```

### Palette tokens

The full token list (per variant) is in `lua/lull/palette.lua`. The most common ones:

| Token                                                         | Role                           |
| ------------------------------------------------------------- | ------------------------------ |
| `bg`, `bg_alt`, `bg_float`, `bg_popup`, `bg_sel`, `bg_cursor` | Surfaces                       |
| `fg`, `fg_alt`, `fg_dim`, `fg_mute`, `fg_subtle`              | Foregrounds, getting quieter   |
| `comment`, `comment_doc`                                      | Comments — faded but readable  |
| `sage`                                                        | Functions                      |
| `slate`                                                       | Keywords                       |
| `amber`                                                       | Strings, search highlight      |
| `mauve`                                                       | Types                          |
| `rose`                                                        | Constants, numbers, booleans   |
| `olive`                                                       | Properties, fields, attributes |
| `teal`                                                        | Regex, escape sequences        |
| `rust`                                                        | `return`, exceptions, `self`   |
| `error`, `warn`, `info`, `hint`, `ok`                         | Diagnostic colors              |

You can read the resolved palette at any time:

```lua
local p = require("lull").colors()  -- current variant
local p_dark = require("lull").colors("dark")
```

### Lualine

Three ways to wire it up, pick whichever fits your config style:

```lua
-- 1. By name (auto-discovered via lua/lualine/themes/lull.lua)
require("lualine").setup({ options = { theme = "lull" } })

-- 2. As a table — follows the active lull style at call time
require("lualine").setup({
  options = { theme = require("lull").lualine() },
})

-- 3. Pinned to a specific variant
require("lualine").setup({
  options = { theme = require("lull").lualine("dark") },
})
```

The theme reads from `require("lull").colors()`, so any palette override you pass to `setup()` (or any `on_highlights` adjustment that swaps tokens) flows into the statusline automatically.

#### Live variant switching

Lualine caches the theme it was given at setup time. If you toggle `vim.o.background` at runtime and want lualine to re-pull lull's colors, listen for `ColorScheme`:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "lull",
  callback = function()
    require("lualine").setup({
      options = { theme = require("lull").lualine() },
      -- …your other lualine options
    })
  end,
})
```

#### Sections, palette access

If you want to color individual lualine components using lull's tokens:

```lua
local p = require("lull").colors()

require("lualine").setup({
  options = { theme = "lull" },
  sections = {
    lualine_c = {
      { "filename", color = { fg = p.fg, gui = "bold" } },
      { "diff",
        symbols = { added = "+", modified = "~", removed = "-" },
        diff_color = {
          added    = { fg = p.git_add },
          modified = { fg = p.git_change },
          removed  = { fg = p.git_delete },
        },
      },
    },
    lualine_x = {
      { "diagnostics",
        sources = { "nvim_diagnostic" },
        diagnostics_color = {
          error = { fg = p.error },
          warn  = { fg = p.warn },
          info  = { fg = p.info },
          hint  = { fg = p.hint },
        },
      },
      "filetype",
    },
  },
})
```

The full token list is in [`lua/lull/palette.lua`](./lua/lull/palette.lua) and summarized [above](#palette-tokens).

#### Mode colors

Lull's mode-A blocks follow the accent palette:

| Mode     | Background | Foreground |
| -------- | ---------- | ---------- |
| Normal   | `slate`    | `bg`       |
| Insert   | `sage`     | `bg`       |
| Visual   | `mauve`    | `bg`       |
| Replace  | `rose`     | `bg`       |
| Command  | `amber`    | `bg`       |
| Terminal | `teal`     | `bg`       |
| Inactive | `bg_alt`   | `fg_mute`  |

Override any of these via `palette` or `on_highlights` in `setup()` and the lualine theme updates with them.

### Disabling plugin integrations

Set the plugin's key to `false` to skip its highlight group:

```lua
require("lull").setup({
  plugins = { which_key = false, lazy = false },
})
```

### Custom overrides

Two override layers, in order of application:

1. **`palette.<variant>`** — change the underlying tokens. Everything downstream picks up the new value.
2. **`on_highlights(p, hl)`** — last-mile override of any highlight group. Mutate `hl` in place.

```lua
require("lull").setup({
  palette = {
    dark = { sage = "#a6c0a6" },  -- a touch greener functions
  },
  on_highlights = function(p, hl)
    -- Make line numbers fade further
    hl.LineNr = { fg = "#4a4d55", bg = p.bg }
    -- Subtle keyword italics in Lua only
    hl["@keyword.lua"] = { fg = p.slate, italic = true }
  end,
})
```

## Design philosophy

- **Low-contrast but readable.** Comments recede; primary code rests gently in the foreground.
- **Warm undertones.** Backgrounds skew warm-charcoal / warm-linen to reduce blue-light fatigue.
- **Dusty accents.** Sage green, dusty rose, faded amber, slate blue, soft mauve — never neon.
- **Quiet hierarchy.** Functions sit a hair brighter than identifiers, strings are warm, keywords are slightly muted slate, comments are noticeably faded.
- **No pure black, no pure white.** Anywhere.

## Project structure

```
lull.nvim/
├── colors/
│   └── lull.lua                  # :colorscheme entry point
├── lua/
│   ├── lull/
│   │   ├── init.lua              # public API (setup, load, colors, lualine)
│   │   ├── config.lua            # defaults + merge logic
│   │   ├── palette.lua           # dark + light color tables
│   │   ├── theme.lua             # assembles all groups, applies via vim.api.nvim_set_hl
│   │   ├── lualine.lua           # lualine theme (M.theme / M.dark / M.light)
│   │   └── groups/
│   │       ├── editor.lua        # UI chrome (Normal, StatusLine, Pmenu, …)
│   │       ├── syntax.lua        # classic vim syntax (Comment, Type, …)
│   │       ├── treesitter.lua    # @captures
│   │       ├── lsp.lua           # @lsp.type.* / @lsp.mod.* / LSP UI
│   │       ├── diagnostics.lua   # Diagnostic*
│   │       └── plugins.lua       # plugin highlight groups
│   └── lualine/
│       └── themes/
│           └── lull.lua          # makes `theme = "lull"` work in lualine
└── README.md
```

## Contributing

PRs and issues welcome. When adding plugin support, gate the block on `cfg.plugins.<name>` in `lua/lull/groups/plugins.lua` and add the toggle to `lua/lull/config.lua`'s `plugins` table.

## License

MIT.
