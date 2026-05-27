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

## Screenshots

<!-- Drop screenshots here -->

| Dark                            | Light                             |
| ------------------------------- | --------------------------------- |
| ![dark](./assets/lull-dark.png) | ![light](./assets/lull-light.png) |

| Diagnostics                                   | Telescope                                 |
| --------------------------------------------- | ----------------------------------------- |
| ![diagnostics](./assets/lull-diagnostics.png) | ![telescope](./assets/lull-telescope.png) |

## Requirements

- Neovim **0.10+** (uses `vim.api.nvim_set_hl`, `vim.hl.priorities`, undercurl with `sp=`)
- A terminal with true-color support (`termguicolors` is enabled automatically)

## Installation

### lazy.nvim

```lua
{
  "your-handle/lull.nvim",
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
  "your-handle/lull.nvim",
  config = function()
    require("lull").setup({})
    vim.cmd.colorscheme("lull")
  end,
}
```

### vim-plug / built-in `:packadd`

```vim
Plug 'your-handle/lull.nvim'
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

```lua
require("lualine").setup({
  options = {
    theme = require("lull").lualine(),       -- follows current style
    -- or:
    -- theme = require("lull").lualine("dark"),
  },
})
```

The theme reacts to your current `style`/`background`, so toggling variants and re-running `:colorscheme lull` (or listening for the `ColorScheme` autocmd) updates the statusline automatically.

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
│   └── lull/
│       ├── init.lua              # public API (setup, load, colors, lualine)
│       ├── config.lua            # defaults + merge logic
│       ├── palette.lua           # dark + light color tables
│       ├── theme.lua             # assembles all groups, applies via vim.api.nvim_set_hl
│       ├── lualine.lua           # lualine theme
│       └── groups/
│           ├── editor.lua        # UI chrome (Normal, StatusLine, Pmenu, …)
│           ├── syntax.lua        # classic vim syntax (Comment, Type, …)
│           ├── treesitter.lua    # @captures
│           ├── lsp.lua           # @lsp.type.* / @lsp.mod.* / LSP UI
│           ├── diagnostics.lua   # Diagnostic*
│           └── plugins.lua       # plugin highlight groups
└── README.md
```

## Contributing

PRs and issues welcome. When adding plugin support, gate the block on `cfg.plugins.<name>` in `lua/lull/groups/plugins.lua` and add the toggle to `lua/lull/config.lua`'s `plugins` table.

## License

MIT.
