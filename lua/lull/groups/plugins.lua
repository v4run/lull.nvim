-- lull.nvim — plugin highlight groups.
-- Each block is wrapped in `if cfg.plugins.<name>` so users can disable
-- individual integrations or override them via on_highlights.

local M = {}

function M.get(p, cfg)
  local hl = {}
  local function add(t)
    for k, v in pairs(t) do hl[k] = v end
  end

  local pl = cfg.plugins or {}

  -- =======================================================================
  -- Telescope
  -- =======================================================================
  if pl.telescope then add({
    TelescopeNormal         = { fg = p.fg, bg = p.bg_float },
    TelescopeBorder         = { fg = p.border_lift, bg = p.bg_float },
    TelescopeTitle          = { fg = p.fg, bg = p.bg_float, bold = true },
    TelescopePromptNormal   = { fg = p.fg, bg = p.bg_popup },
    TelescopePromptBorder   = { fg = p.border_lift, bg = p.bg_popup },
    TelescopePromptTitle    = { fg = p.amber, bg = p.bg_popup, bold = true },
    TelescopePromptPrefix   = { fg = p.slate, bg = p.bg_popup },
    TelescopePromptCounter  = { fg = p.fg_dim, bg = p.bg_popup },
    TelescopeResultsNormal  = { fg = p.fg, bg = p.bg_float },
    TelescopeResultsBorder  = { fg = p.border_lift, bg = p.bg_float },
    TelescopeResultsTitle   = { fg = p.bg_float, bg = p.bg_float },
    TelescopePreviewNormal  = { fg = p.fg, bg = p.bg_float },
    TelescopePreviewBorder  = { fg = p.border_lift, bg = p.bg_float },
    TelescopePreviewTitle   = { fg = p.sage, bg = p.bg_float, bold = true },
    TelescopeSelection      = { fg = p.fg, bg = p.bg_sel, bold = true },
    TelescopeSelectionCaret = { fg = p.amber, bg = p.bg_sel },
    TelescopeMultiSelection = { fg = p.mauve, bg = p.bg_sel },
    TelescopeMatching       = { fg = p.amber, bold = true },
    TelescopeResultsClass   = { fg = p.mauve },
    TelescopeResultsField   = { fg = p.olive },
    TelescopeResultsFunction = { fg = p.sage },
    TelescopeResultsMethod  = { fg = p.sage },
    TelescopeResultsVariable = { fg = p.fg },
    TelescopeResultsIdentifier = { fg = p.fg },
    TelescopeResultsComment = { fg = p.comment },
  }) end

  -- =======================================================================
  -- Neo-tree / nvim-tree
  -- =======================================================================
  if pl.neo_tree then add({
    NeoTreeNormal           = { fg = p.fg_alt, bg = p.bg_alt },
    NeoTreeNormalNC         = { fg = p.fg_alt, bg = p.bg_alt },
    NeoTreeRootName         = { fg = p.fg, bold = true },
    NeoTreeDirectoryName    = { fg = p.slate },
    NeoTreeDirectoryIcon    = { fg = p.slate },
    NeoTreeFileName         = { fg = p.fg_alt },
    NeoTreeFileIcon         = { fg = p.fg_dim },
    NeoTreeFileNameOpened   = { fg = p.fg, bold = true },
    NeoTreeIndentMarker     = { fg = p.nontext },
    NeoTreeExpander         = { fg = p.fg_dim },
    NeoTreeWinSeparator     = { fg = p.bg_alt, bg = p.bg_alt },
    NeoTreeEndOfBuffer      = { fg = p.bg_alt, bg = p.bg_alt },
    NeoTreeGitAdded         = { fg = p.git_add },
    NeoTreeGitDeleted       = { fg = p.git_delete },
    NeoTreeGitModified      = { fg = p.git_change },
    NeoTreeGitConflict      = { fg = p.rust, bold = true },
    NeoTreeGitUntracked     = { fg = p.fg_dim, italic = true },
    NeoTreeGitIgnored       = { fg = p.fg_subtle },
    NeoTreeGitStaged        = { fg = p.sage },
    NeoTreeGitRenamed       = { fg = p.mauve },
    NeoTreeSymbolicLinkTarget = { fg = p.teal, italic = true },
    NeoTreeTitleBar         = { fg = p.fg, bg = p.bg_popup, bold = true },
    NeoTreeFloatBorder      = { fg = p.border_lift, bg = p.bg_float },
    NeoTreeFloatTitle       = { fg = p.fg, bg = p.bg_float, bold = true },
    NeoTreeCursorLine       = { bg = p.bg_sel },
  }) end

  if pl.nvim_tree then add({
    NvimTreeNormal          = { fg = p.fg_alt, bg = p.bg_alt },
    NvimTreeNormalNC        = { fg = p.fg_alt, bg = p.bg_alt },
    NvimTreeRootFolder      = { fg = p.fg, bold = true },
    NvimTreeFolderName      = { fg = p.slate },
    NvimTreeOpenedFolderName = { fg = p.slate, bold = true },
    NvimTreeEmptyFolderName = { fg = p.fg_dim },
    NvimTreeFolderIcon      = { fg = p.slate },
    NvimTreeIndentMarker    = { fg = p.nontext },
    NvimTreeOpenedFile      = { fg = p.fg, bold = true },
    NvimTreeSpecialFile     = { fg = p.amber },
    NvimTreeGitDirty        = { fg = p.git_change },
    NvimTreeGitNew          = { fg = p.git_add },
    NvimTreeGitDeleted      = { fg = p.git_delete },
    NvimTreeGitStaged       = { fg = p.sage },
    NvimTreeGitMerge        = { fg = p.rust },
    NvimTreeGitRenamed      = { fg = p.mauve },
    NvimTreeGitIgnored      = { fg = p.fg_subtle },
    NvimTreeWinSeparator    = { fg = p.bg_alt, bg = p.bg_alt },
    NvimTreeEndOfBuffer     = { fg = p.bg_alt, bg = p.bg_alt },
  }) end

  -- =======================================================================
  -- Gitsigns
  -- =======================================================================
  if pl.gitsigns then add({
    GitSignsAdd             = { fg = p.git_add },
    GitSignsChange          = { fg = p.git_change },
    GitSignsDelete          = { fg = p.git_delete },
    GitSignsTopdelete       = { fg = p.git_delete },
    GitSignsChangedelete    = { fg = p.rust },
    GitSignsUntracked       = { fg = p.fg_dim },
    GitSignsAddNr           = { fg = p.git_add },
    GitSignsChangeNr        = { fg = p.git_change },
    GitSignsDeleteNr        = { fg = p.git_delete },
    GitSignsAddLn           = { bg = p.diff_add },
    GitSignsChangeLn        = { bg = p.diff_change },
    GitSignsDeleteLn        = { bg = p.diff_delete },
    GitSignsAddInline       = { bg = p.diff_text },
    GitSignsDeleteInline    = { fg = p.git_delete, bg = p.diff_delete, bold = true },
    GitSignsChangeInline    = { bg = p.diff_text },
    GitSignsCurrentLineBlame = { fg = p.fg_subtle, italic = true },
  }) end

  -- =======================================================================
  -- WhichKey
  -- =======================================================================
  if pl.which_key then add({
    WhichKey            = { fg = p.amber },
    WhichKeyGroup       = { fg = p.slate },
    WhichKeyDesc        = { fg = p.fg },
    WhichKeySeparator   = { fg = p.fg_subtle },
    WhichKeyFloat       = { bg = p.bg_float },
    WhichKeyBorder      = { fg = p.border_lift, bg = p.bg_float },
    WhichKeyTitle       = { fg = p.fg, bg = p.bg_float, bold = true },
    WhichKeyValue       = { fg = p.fg_dim },
    WhichKeyIcon        = { fg = p.sage },
  }) end

  -- =======================================================================
  -- nvim-cmp
  -- =======================================================================
  if pl.nvim_cmp then add({
    CmpItemAbbr             = { fg = p.fg_alt },
    CmpItemAbbrDeprecated   = { fg = p.fg_dim, strikethrough = true },
    CmpItemAbbrMatch        = { fg = p.amber, bold = true },
    CmpItemAbbrMatchFuzzy   = { fg = p.amber, bold = true },
    CmpItemMenu             = { fg = p.fg_subtle, italic = true },
    CmpItemKind             = { fg = p.mauve },
    CmpItemKindText         = { fg = p.fg },
    CmpItemKindMethod       = { fg = p.sage },
    CmpItemKindFunction     = { fg = p.sage },
    CmpItemKindConstructor  = { fg = p.mauve },
    CmpItemKindField        = { fg = p.olive },
    CmpItemKindVariable     = { fg = p.fg },
    CmpItemKindClass        = { fg = p.mauve },
    CmpItemKindInterface    = { fg = p.mauve },
    CmpItemKindModule       = { fg = p.fg_alt },
    CmpItemKindProperty     = { fg = p.olive },
    CmpItemKindUnit         = { fg = p.rose },
    CmpItemKindValue        = { fg = p.rose },
    CmpItemKindEnum         = { fg = p.mauve },
    CmpItemKindKeyword      = { fg = p.slate },
    CmpItemKindSnippet      = { fg = p.teal },
    CmpItemKindColor        = { fg = p.rose },
    CmpItemKindFile         = { fg = p.slate },
    CmpItemKindReference    = { fg = p.slate },
    CmpItemKindFolder       = { fg = p.slate },
    CmpItemKindEnumMember   = { fg = p.rose },
    CmpItemKindConstant     = { fg = p.rose },
    CmpItemKindStruct       = { fg = p.mauve },
    CmpItemKindEvent        = { fg = p.teal },
    CmpItemKindOperator     = { fg = p.fg_alt },
    CmpItemKindTypeParameter = { fg = p.mauve, italic = true },
    CmpItemKindCopilot      = { fg = p.sage },
  }) end

  -- =======================================================================
  -- blink.cmp
  -- =======================================================================
  if pl.blink_cmp then add({
    BlinkCmpMenu            = { fg = p.fg, bg = p.bg_popup },
    BlinkCmpMenuBorder      = { fg = p.border_lift, bg = p.bg_popup },
    BlinkCmpMenuSelection   = { fg = p.fg, bg = p.bg_sel, bold = true },
    BlinkCmpScrollBarGutter = { bg = p.bg_alt },
    BlinkCmpScrollBarThumb  = { bg = p.border_lift },
    BlinkCmpLabel           = { fg = p.fg_alt },
    BlinkCmpLabelDeprecated = { fg = p.fg_dim, strikethrough = true },
    BlinkCmpLabelMatch      = { fg = p.amber, bold = true },
    BlinkCmpLabelDescription = { fg = p.fg_subtle, italic = true },
    BlinkCmpLabelDetail     = { fg = p.fg_dim, italic = true },
    BlinkCmpKind            = { fg = p.mauve },
    BlinkCmpKindClass       = { fg = p.mauve },
    BlinkCmpKindConstant    = { fg = p.rose },
    BlinkCmpKindConstructor = { fg = p.mauve },
    BlinkCmpKindEnum        = { fg = p.mauve },
    BlinkCmpKindEnumMember  = { fg = p.rose },
    BlinkCmpKindEvent       = { fg = p.teal },
    BlinkCmpKindField       = { fg = p.olive },
    BlinkCmpKindFunction    = { fg = p.sage },
    BlinkCmpKindInterface   = { fg = p.mauve },
    BlinkCmpKindKeyword     = { fg = p.slate },
    BlinkCmpKindMethod      = { fg = p.sage },
    BlinkCmpKindModule      = { fg = p.fg_alt },
    BlinkCmpKindOperator    = { fg = p.fg_alt },
    BlinkCmpKindProperty    = { fg = p.olive },
    BlinkCmpKindReference   = { fg = p.slate },
    BlinkCmpKindSnippet     = { fg = p.teal },
    BlinkCmpKindStruct      = { fg = p.mauve },
    BlinkCmpKindText        = { fg = p.fg },
    BlinkCmpKindTypeParameter = { fg = p.mauve, italic = true },
    BlinkCmpKindUnit        = { fg = p.rose },
    BlinkCmpKindValue       = { fg = p.rose },
    BlinkCmpKindVariable    = { fg = p.fg },
    BlinkCmpSource          = { fg = p.fg_subtle, italic = true },
    BlinkCmpGhostText       = { fg = p.fg_subtle, italic = true },
    BlinkCmpDoc             = { fg = p.fg, bg = p.bg_float },
    BlinkCmpDocBorder       = { fg = p.border_lift, bg = p.bg_float },
    BlinkCmpDocSeparator    = { fg = p.border },
    BlinkCmpSignatureHelp   = { fg = p.fg, bg = p.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = p.border_lift, bg = p.bg_float },
    BlinkCmpSignatureHelpActiveParameter = { fg = p.amber, bold = true, underline = true },
  }) end

  -- =======================================================================
  -- noice.nvim
  -- =======================================================================
  if pl.noice then add({
    NoiceCmdline                = { fg = p.fg, bg = p.bg_float },
    NoiceCmdlinePopup           = { fg = p.fg, bg = p.bg_float },
    NoiceCmdlinePopupBorder     = { fg = p.border_lift, bg = p.bg_float },
    NoiceCmdlinePopupTitle      = { fg = p.amber, bg = p.bg_float, bold = true },
    NoiceCmdlineIcon            = { fg = p.amber },
    NoiceCmdlineIconSearch      = { fg = p.amber },
    NoiceCmdlinePopupBorderSearch = { fg = p.amber, bg = p.bg_float },
    NoiceConfirm                = { fg = p.fg, bg = p.bg_float },
    NoiceConfirmBorder          = { fg = p.border_lift, bg = p.bg_float },
    NoicePopup                  = { fg = p.fg, bg = p.bg_float },
    NoicePopupBorder            = { fg = p.border_lift, bg = p.bg_float },
    NoicePopupmenu              = { fg = p.fg, bg = p.bg_popup },
    NoicePopupmenuBorder        = { fg = p.border_lift, bg = p.bg_popup },
    NoicePopupmenuSelected      = { fg = p.fg, bg = p.bg_sel, bold = true },
    NoicePopupmenuMatch         = { fg = p.amber, bold = true },
    NoiceMini                   = { fg = p.fg, bg = p.bg_alt },
    NoiceLspProgressTitle       = { fg = p.fg_dim },
    NoiceLspProgressClient      = { fg = p.slate },
    NoiceLspProgressSpinner     = { fg = p.amber },
    NoiceFormatProgressDone     = { fg = p.sage },
    NoiceFormatProgressTodo     = { fg = p.fg_subtle },
    NoiceVirtualText            = { fg = p.fg_dim, italic = true },
  }) end

  -- =======================================================================
  -- mini.nvim modules
  -- =======================================================================
  if pl.mini then add({
    MiniCursorword          = { underline = true },
    MiniCursorwordCurrent   = { underline = true },

    MiniIndentscopeSymbol   = { fg = p.nontext },

    MiniStatuslineModeNormal  = { fg = p.bg, bg = p.slate, bold = true },
    MiniStatuslineModeInsert  = { fg = p.bg, bg = p.sage,  bold = true },
    MiniStatuslineModeVisual  = { fg = p.bg, bg = p.mauve, bold = true },
    MiniStatuslineModeReplace = { fg = p.bg, bg = p.rose,  bold = true },
    MiniStatuslineModeCommand = { fg = p.bg, bg = p.amber, bold = true },
    MiniStatuslineModeOther   = { fg = p.bg, bg = p.teal,  bold = true },
    MiniStatuslineDevinfo     = { fg = p.fg_alt, bg = p.bg_alt },
    MiniStatuslineFilename    = { fg = p.fg_dim, bg = p.bg_alt },
    MiniStatuslineFileinfo    = { fg = p.fg_alt, bg = p.bg_alt },
    MiniStatuslineInactive    = { fg = p.fg_mute, bg = p.bg_alt },

    MiniTablineCurrent        = { fg = p.fg, bg = p.bg, bold = true },
    MiniTablineVisible        = { fg = p.fg_alt, bg = p.bg_alt },
    MiniTablineHidden         = { fg = p.fg_mute, bg = p.bg_alt },
    MiniTablineModifiedCurrent = { fg = p.amber, bg = p.bg, bold = true },
    MiniTablineModifiedVisible = { fg = p.amber, bg = p.bg_alt },
    MiniTablineModifiedHidden = { fg = p.amber, bg = p.bg_alt },
    MiniTablineFill           = { bg = p.bg_alt },
    MiniTablineTabpagesection = { fg = p.bg, bg = p.amber, bold = true },

    MiniPickBorder            = { fg = p.border_lift, bg = p.bg_float },
    MiniPickBorderText        = { fg = p.fg, bg = p.bg_float, bold = true },
    MiniPickNormal            = { fg = p.fg, bg = p.bg_float },
    MiniPickMatchCurrent      = { bg = p.bg_sel, bold = true },
    MiniPickMatchMarked       = { fg = p.mauve, bg = p.bg_sel },
    MiniPickMatchRanges       = { fg = p.amber, bold = true },
    MiniPickPrompt            = { fg = p.amber, bg = p.bg_float, bold = true },

    MiniFilesBorder           = { fg = p.border_lift, bg = p.bg_float },
    MiniFilesTitle            = { fg = p.fg_dim,      bg = p.bg_float },
    MiniFilesTitleFocused     = { fg = p.fg,          bg = p.bg_float, bold = true },
    MiniFilesNormal           = { fg = p.fg,          bg = p.bg_float },
    MiniFilesDirectory        = { fg = p.slate },
    MiniFilesFile             = { fg = p.fg_alt },
    MiniFilesCursorLine       = { bg = p.bg_sel },

    MiniDiffSignAdd           = { fg = p.git_add },
    MiniDiffSignChange        = { fg = p.git_change },
    MiniDiffSignDelete        = { fg = p.git_delete },
    MiniDiffOverAdd           = { bg = p.diff_add },
    MiniDiffOverChange        = { bg = p.diff_change },
    MiniDiffOverDelete        = { bg = p.diff_delete },
    MiniDiffOverContext       = { bg = p.bg_alt },

    MiniHipatternsFixme       = { fg = p.bg, bg = p.error, bold = true },
    MiniHipatternsHack        = { fg = p.bg, bg = p.warn,  bold = true },
    MiniHipatternsTodo        = { fg = p.bg, bg = p.info,  bold = true },
    MiniHipatternsNote        = { fg = p.bg, bg = p.hint,  bold = true },

    MiniTrailspace            = { bg = p.error_bg },
    MiniIconsAzure            = { fg = p.slate },
    MiniIconsBlue             = { fg = p.slate },
    MiniIconsCyan             = { fg = p.teal },
    MiniIconsGreen            = { fg = p.sage },
    MiniIconsGrey             = { fg = p.fg_dim },
    MiniIconsOrange           = { fg = p.amber },
    MiniIconsPurple           = { fg = p.mauve },
    MiniIconsRed              = { fg = p.rose },
    MiniIconsYellow           = { fg = p.olive },
  }) end

  -- =======================================================================
  -- render-markdown.nvim
  -- =======================================================================
  if pl.render_markdown then add({
    RenderMarkdownH1          = { fg = p.slate, bold = true },
    RenderMarkdownH2          = { fg = p.sage, bold = true },
    RenderMarkdownH3          = { fg = p.mauve, bold = true },
    RenderMarkdownH4          = { fg = p.amber, bold = true },
    RenderMarkdownH5          = { fg = p.rose, bold = true },
    RenderMarkdownH6          = { fg = p.teal, bold = true },
    RenderMarkdownH1Bg        = { bg = p.bg_alt },
    RenderMarkdownH2Bg        = { bg = p.bg_alt },
    RenderMarkdownH3Bg        = { bg = p.bg_alt },
    RenderMarkdownH4Bg        = { bg = p.bg_alt },
    RenderMarkdownH5Bg        = { bg = p.bg_alt },
    RenderMarkdownH6Bg        = { bg = p.bg_alt },
    RenderMarkdownCode        = { bg = p.bg_alt },
    RenderMarkdownCodeInline  = { fg = p.amber, bg = p.bg_alt },
    RenderMarkdownBullet      = { fg = p.slate },
    RenderMarkdownChecked     = { fg = p.sage },
    RenderMarkdownUnchecked   = { fg = p.fg_dim },
    RenderMarkdownQuote       = { fg = p.fg_dim, italic = true },
    RenderMarkdownDash        = { fg = p.fg_subtle },
    RenderMarkdownTableHead   = { fg = p.fg, bold = true },
    RenderMarkdownTableRow    = { fg = p.fg_alt },
    RenderMarkdownTableFill   = { fg = p.fg_subtle },
    RenderMarkdownLink        = { fg = p.slate, underline = true },
    RenderMarkdownSign        = { fg = p.fg_dim },
    RenderMarkdownMath        = { fg = p.teal, italic = true },
    RenderMarkdownInfo        = { fg = p.info, bold = true },
    RenderMarkdownSuccess     = { fg = p.ok, bold = true },
    RenderMarkdownHint        = { fg = p.hint, bold = true },
    RenderMarkdownWarn        = { fg = p.warn, bold = true },
    RenderMarkdownError       = { fg = p.error, bold = true },
  }) end

  -- =======================================================================
  -- snacks.nvim
  -- =======================================================================
  if pl.snacks then add({
    SnacksNormal              = { fg = p.fg, bg = p.bg_float },
    SnacksNormalNC            = { fg = p.fg, bg = p.bg_float },
    SnacksWinBar              = { fg = p.fg, bg = p.bg_float, bold = true },
    SnacksBackdrop            = { bg = p.bg_inactive },
    SnacksDashboardNormal     = { fg = p.fg, bg = p.bg },
    SnacksDashboardHeader     = { fg = p.slate, bold = true },
    SnacksDashboardTitle      = { fg = p.amber, bold = true },
    SnacksDashboardFooter     = { fg = p.fg_dim, italic = true },
    SnacksDashboardIcon       = { fg = p.mauve },
    SnacksDashboardDesc       = { fg = p.fg_alt },
    SnacksDashboardKey        = { fg = p.amber, bold = true },
    SnacksDashboardSpecial    = { fg = p.teal },
    SnacksDashboardDir        = { fg = p.slate },
    SnacksDashboardFile       = { fg = p.fg_alt },

    SnacksNotifierInfo        = { fg = p.info, bg = p.bg_float },
    SnacksNotifierWarn        = { fg = p.warn, bg = p.bg_float },
    SnacksNotifierError       = { fg = p.error, bg = p.bg_float },
    SnacksNotifierDebug       = { fg = p.fg_dim, bg = p.bg_float },
    SnacksNotifierTrace       = { fg = p.fg_subtle, bg = p.bg_float },
    SnacksNotifierBorderInfo  = { fg = p.info, bg = p.bg_float },
    SnacksNotifierBorderWarn  = { fg = p.warn, bg = p.bg_float },
    SnacksNotifierBorderError = { fg = p.error, bg = p.bg_float },
    SnacksNotifierIconInfo    = { fg = p.info },
    SnacksNotifierIconWarn    = { fg = p.warn },
    SnacksNotifierIconError   = { fg = p.error },
    SnacksNotifierTitleInfo   = { fg = p.info, bold = true },
    SnacksNotifierTitleWarn   = { fg = p.warn, bold = true },
    SnacksNotifierTitleError  = { fg = p.error, bold = true },
    SnacksNotifierFooterInfo  = { fg = p.fg_dim, italic = true },

    SnacksPickerBorder        = { fg = p.border_lift, bg = p.bg_float },
    SnacksPickerTitle         = { fg = p.amber, bg = p.bg_float, bold = true },
    SnacksPickerInput         = { fg = p.fg, bg = p.bg_popup },
    SnacksPickerInputBorder   = { fg = p.border_lift, bg = p.bg_popup },
    SnacksPickerList          = { fg = p.fg, bg = p.bg_float },
    SnacksPickerListCursorLine = { bg = p.bg_sel },
    SnacksPickerPreview       = { fg = p.fg, bg = p.bg_float },
    SnacksPickerPreviewBorder = { fg = p.border_lift, bg = p.bg_float },
    SnacksPickerMatch         = { fg = p.amber, bold = true },
    SnacksPickerSelected      = { fg = p.mauve, bg = p.bg_sel },
    SnacksPickerDir           = { fg = p.fg_dim },
    SnacksPickerFile          = { fg = p.fg_alt },
    SnacksPickerLineNr        = { fg = p.fg_subtle },

    SnacksIndent              = { fg = p.nontext },
    SnacksIndentScope         = { fg = p.border_lift },
    SnacksIndentChunk         = { fg = p.border_lift },

    SnacksScratchTitle        = { fg = p.amber, bold = true },
    SnacksScratchKey          = { fg = p.slate, bold = true },
    SnacksScratchDesc         = { fg = p.fg_alt },

    SnacksTerminal            = { fg = p.fg, bg = p.bg },
    SnacksTerminalNormal      = { fg = p.fg, bg = p.bg },
  }) end

  -- =======================================================================
  -- treesitter-context
  -- =======================================================================
  if pl.treesitter_context then add({
    TreesitterContext           = { bg = p.bg_alt },
    TreesitterContextLineNumber = { fg = p.fg_subtle, bg = p.bg_alt },
    TreesitterContextBottom     = { underline = true, sp = p.border },
    TreesitterContextSeparator  = { fg = p.border },
  }) end

  -- =======================================================================
  -- indent-blankline (ibl v3)
  -- =======================================================================
  if pl.indent_blankline then add({
    IblIndent       = { fg = p.nontext },
    IblWhitespace   = { fg = p.nontext },
    IblScope        = { fg = p.border_lift },
  }) end

  -- =======================================================================
  -- flash.nvim
  -- =======================================================================
  if pl.flash then add({
    FlashBackdrop       = { fg = p.fg_subtle },
    FlashMatch          = { fg = p.bg, bg = p.amber, bold = true },
    FlashCurrent        = { fg = p.bg, bg = p.amber, bold = true },
    FlashLabel          = { fg = p.bg, bg = p.mauve, bold = true },
    FlashPrompt         = { fg = p.fg, bg = p.bg_alt },
    FlashPromptIcon     = { fg = p.amber },
    FlashCursor         = { fg = p.bg, bg = p.fg },
  }) end

  -- =======================================================================
  -- trouble.nvim
  -- =======================================================================
  if pl.trouble then add({
    TroubleNormal       = { fg = p.fg, bg = p.bg_alt },
    TroubleNormalNC     = { fg = p.fg, bg = p.bg_alt },
    TroubleText         = { fg = p.fg_alt },
    TroubleSource       = { fg = p.fg_dim, italic = true },
    TroubleCode         = { fg = p.fg_subtle },
    TroubleFile         = { fg = p.fg, bold = true },
    TroubleDirectory    = { fg = p.slate },
    TroubleCount        = { fg = p.mauve, bold = true },
    TroubleFoldIcon     = { fg = p.fg_dim },
    TroubleIndent       = { fg = p.nontext },
    TroubleIndentLast   = { fg = p.nontext },
    TroubleIndentTop    = { fg = p.nontext },
    TroubleIndentMiddle = { fg = p.nontext },
    TroubleIndentWs     = { fg = p.nontext },
    TroublePos          = { fg = p.fg_subtle },
    TroubleLocation     = { fg = p.fg_subtle, italic = true },
    TroubleIconError    = { fg = p.error },
    TroubleIconWarn     = { fg = p.warn },
    TroubleIconInfo     = { fg = p.info },
    TroubleIconHint     = { fg = p.hint },
  }) end

  -- =======================================================================
  -- lazy.nvim
  -- =======================================================================
  if pl.lazy then add({
    LazyNormal        = { fg = p.fg, bg = p.bg_float },
    LazyButton        = { fg = p.fg, bg = p.bg_alt },
    LazyButtonActive  = { fg = p.bg, bg = p.amber, bold = true },
    LazyH1            = { fg = p.fg, bg = p.bg_alt, bold = true },
    LazyH2            = { fg = p.slate, bold = true },
    LazySpecial       = { fg = p.amber },
    LazyProp          = { fg = p.olive },
    LazyValue         = { fg = p.fg_alt },
    LazyCommit        = { fg = p.rose },
    LazyDir           = { fg = p.slate },
    LazyUrl           = { fg = p.slate, underline = true },
    LazyReasonPlugin  = { fg = p.mauve },
    LazyReasonImport  = { fg = p.sage },
    LazyReasonRuntime = { fg = p.amber },
    LazyReasonSource  = { fg = p.teal },
    LazyReasonStart   = { fg = p.sage },
    LazyReasonCmd     = { fg = p.olive },
    LazyReasonEvent   = { fg = p.rose },
    LazyReasonKeys    = { fg = p.slate },
    LazyReasonFt      = { fg = p.teal },
    LazyProgressTodo  = { fg = p.fg_subtle },
    LazyProgressDone  = { fg = p.sage },
  }) end

  -- =======================================================================
  -- mason.nvim
  -- =======================================================================
  if pl.mason then add({
    MasonNormal               = { fg = p.fg, bg = p.bg_float },
    MasonHeader               = { fg = p.bg, bg = p.slate, bold = true },
    MasonHeaderSecondary      = { fg = p.bg, bg = p.amber, bold = true },
    MasonHighlight            = { fg = p.amber },
    MasonHighlightBlock       = { fg = p.bg, bg = p.sage },
    MasonHighlightBlockBold   = { fg = p.bg, bg = p.sage, bold = true },
    MasonHighlightSecondary   = { fg = p.mauve },
    MasonMuted                = { fg = p.fg_dim },
    MasonMutedBlock           = { fg = p.fg_alt, bg = p.bg_alt },
    MasonError                = { fg = p.error },
    MasonWarning              = { fg = p.warn },
    MasonHeading              = { bold = true },
    MasonLink                 = { fg = p.slate, underline = true },
  }) end

  return hl
end

return M
