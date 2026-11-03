-- Deep Ocean - Purple
-- Adapted from kaualima.klm-deep-ocean-theme
-- Native Neovim / LazyVim colorscheme

vim.opt.termguicolors = true
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "deep-ocean-purple"

local c = {
  bg = "#13111B",
  bg_dark = "#0C0A13",
  bg_sidebar = "#0C0A13",
  bg_panel = "#0C0A13",
  bg_selected = "#12101D",
  bg_input = "#1F222A",
  bg_highlight = "#2F3441",

  fg = "#D8D8D8",
  fg_dim = "#626984",
  comment = "#62687C",

  purple = "#976ECF",
  purple_light = "#B689FF",
  purple_type = "#9D73D8",
  purple_json = "#8B71D8",

  pink = "#E96FB4",
  red = "#FD5E5E",
  red_alt = "#FF5370",
  orange = "#EC9A3C",
  yellow = "#FFBF57",

  green = "#6DC743",
  green_light = "#9EE67D",
  blue = "#72A7E4",
  blue_light = "#82AAFF",
  cyan = "#89DDFF",
  teal = "#ADE2DD",

  white = "#E6EDFF",
  error = "#F82F51",
}

local hl = vim.api.nvim_set_hl

local function set(group, opts)
  hl(0, group, opts)
end

local function fg(group, color, extra)
  set(group, vim.tbl_extend("force", { fg = color }, extra or {}))
end

local function bg(group, color, extra)
  set(group, vim.tbl_extend("force", { bg = color }, extra or {}))
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

-- Editor
set("Normal", { fg = c.fg, bg = c.bg })
set("NormalNC", { fg = c.fg, bg = c.bg })
set("NormalFloat", { fg = c.fg, bg = c.bg_dark })
set("FloatBorder", { fg = c.purple, bg = c.bg_dark })
set("FloatTitle", { fg = c.purple_light, bg = c.bg_dark, bold = true })

bg("SignColumn", c.bg)
bg("EndOfBuffer", c.bg)
bg("CursorLine", "#2F3441")
bg("ColorColumn", c.bg_selected)
bg("CursorColumn", c.bg_selected)
bg("Visual", c.bg_highlight)
bg("VisualNOS", c.bg_highlight)

fg("Cursor", c.purple)
fg("lCursor", c.purple)
fg("CursorIM", c.purple)
set("CursorLineNr", { fg = c.fg, bold = true })
fg("LineNr", "#454052")
fg("NonText", "#454052")
fg("Whitespace", "#454052")
fg("SpecialKey", c.purple)

-- Search
set("Search", { fg = c.bg, bg = c.purple_light })
set("IncSearch", { fg = c.bg, bg = c.orange })
set("CurSearch", { fg = c.bg, bg = c.purple_light, bold = true })

-- Syntax: traditional groups
fg("Comment", c.comment, { italic = true })
fg("Constant", c.blue)
fg("String", c.green)
fg("Character", c.green_light)
fg("Number", c.blue)
fg("Boolean", c.blue)
fg("Float", c.blue)

fg("Identifier", c.fg)
fg("Function", c.orange)

fg("Statement", c.pink)
fg("Conditional", c.pink, { italic = true })
fg("Repeat", c.pink, { italic = true })
fg("Label", c.pink)
fg("Operator", c.pink)
fg("Keyword", c.pink)
fg("Exception", c.pink)

fg("PreProc", c.purple_type)
fg("Include", c.purple_type)
fg("Define", c.purple_type)
fg("Macro", c.purple_type)

fg("Type", c.purple_type, { italic = true })
fg("StorageClass", c.pink)
fg("Structure", c.purple_type)
fg("Typedef", c.purple_type)

fg("Special", c.cyan)
fg("SpecialChar", c.cyan)
fg("Delimiter", c.pink)
fg("Tag", c.red)
fg("SpecialComment", c.comment, { italic = true })
fg("Underlined", c.blue_light, { underline = true })

fg("Error", c.error, { italic = true, underline = true })
fg("Todo", c.yellow, { bold = true })

-- Tree-sitter
local captures = {
  ["@comment"] = { fg = c.comment, italic = true },
  ["@comment.documentation"] = { fg = c.comment, italic = true },

  ["@string"] = { fg = c.green },
  ["@string.documentation"] = { fg = c.green },
  ["@string.escape"] = { fg = c.cyan },
  ["@string.special"] = { fg = c.green_light },
  ["@string.regexp"] = { fg = c.cyan },

  ["@character"] = { fg = c.green },
  ["@character.special"] = { fg = c.cyan },

  ["@number"] = { fg = c.blue },
  ["@number.float"] = { fg = c.blue },
  ["@boolean"] = { fg = c.blue },
  ["@constant"] = { fg = c.blue },
  ["@constant.builtin"] = { fg = c.blue },

  ["@variable"] = { fg = c.fg },
  ["@variable.builtin"] = { fg = c.red_alt, italic = true },
  ["@variable.parameter"] = { fg = c.blue, italic = true },
  ["@variable.member"] = { fg = c.fg },

  ["@function"] = { fg = c.orange },
  ["@function.call"] = { fg = c.orange },
  ["@function.method"] = { fg = c.blue_light, italic = true },
  ["@function.method.call"] = { fg = c.blue_light, italic = true },
  ["@function.builtin"] = { fg = c.orange },

  ["@constructor"] = { fg = c.purple_type },
  ["@type"] = { fg = c.purple_type, italic = true },
  ["@type.builtin"] = { fg = c.purple_type, italic = true },
  ["@type.definition"] = { fg = c.purple_type },

  ["@keyword"] = { fg = c.pink },
  ["@keyword.function"] = { fg = c.pink },
  ["@keyword.operator"] = { fg = c.pink },
  ["@keyword.return"] = { fg = c.pink },
  ["@keyword.conditional"] = { fg = c.pink, italic = true },
  ["@keyword.repeat"] = { fg = c.pink, italic = true },
  ["@keyword.import"] = { fg = c.pink },

  ["@operator"] = { fg = c.pink },
  ["@punctuation"] = { fg = c.pink },
  ["@punctuation.bracket"] = { fg = c.fg },
  ["@punctuation.delimiter"] = { fg = c.pink },
  ["@punctuation.special"] = { fg = c.fg },

  ["@property"] = { fg = c.purple_type },
  ["@attribute"] = { fg = c.yellow, italic = true },
  ["@tag"] = { fg = c.red },
  ["@tag.attribute"] = { fg = c.yellow, italic = true },
  ["@tag.delimiter"] = { fg = c.fg },

  ["@module"] = { fg = c.purple_type },
  ["@namespace"] = { fg = c.purple_type },

  ["@constant.macro"] = { fg = c.blue },
  ["@function.macro"] = { fg = c.orange },

  ["@markup.heading"] = { fg = "#C3E88D", bold = true },
  ["@markup.strong"] = { fg = "#F07178", bold = true },
  ["@markup.italic"] = { fg = "#F07178", italic = true },
  ["@markup.link"] = { fg = c.blue_light, underline = true },
  ["@markup.raw"] = { fg = "#C792EA" },
  ["@markup.quote"] = { fg = c.comment, italic = true },
  ["@markup.list"] = { fg = c.pink },
  ["@markup.strikethrough"] = { fg = c.red_alt, strikethrough = true },

  ["@diff.plus"] = { fg = "#C3E88D" },
  ["@diff.minus"] = { fg = c.red_alt },
  ["@diff.delta"] = { fg = "#C792EA" },
}

for group, opts in pairs(captures) do
  set(group, opts)
end

-- LSP semantic tokens
local semantic = {
  ["@lsp.type.class"] = { fg = c.purple_type, italic = true },
  ["@lsp.type.interface"] = { fg = c.purple_type, italic = true },
  ["@lsp.type.enum"] = { fg = c.purple_type },
  ["@lsp.type.type"] = { fg = c.purple_type },
  ["@lsp.type.struct"] = { fg = c.purple_type },
  ["@lsp.type.function"] = { fg = c.orange },
  ["@lsp.type.method"] = { fg = c.blue_light, italic = true },
  ["@lsp.type.parameter"] = { fg = c.blue, italic = true },
  ["@lsp.type.property"] = { fg = c.purple_type },
  ["@lsp.type.variable"] = { fg = c.fg },
  ["@lsp.type.keyword"] = { fg = c.pink },
  ["@lsp.type.namespace"] = { fg = c.purple_type },
  ["@lsp.type.decorator"] = { fg = c.blue_light, italic = true },
  ["@lsp.type.operator"] = { fg = c.pink },
}

for group, opts in pairs(semantic) do
  set(group, opts)
end

-- -- Diagnostics
-- fg("DiagnosticError", c.error)
-- fg("DiagnosticWarn", c.yellow)
-- fg("DiagnosticInfo", c.blue)
-- fg("DiagnosticHint", c.cyan)
--
-- fg("DiagnosticVirtualTextError", c.error)
-- fg("DiagnosticVirtualTextWarn", c.yellow)
-- fg("DiagnosticVirtualTextInfo", c.blue)
-- fg("DiagnosticVirtualTextHint", c.cyan)
--
-- fg("DiagnosticUnderlineError", c.error, { undercurl = true })
-- fg("DiagnosticUnderlineWarn", c.yellow, { undercurl = true })
-- fg("DiagnosticUnderlineInfo", c.blue, { undercurl = true })
-- fg("DiagnosticUnderlineHint", c.cyan, { undercurl = true })
-- Diagnostics
-- Keep source code foreground colors unchanged.
-- Only diagnostic messages and signs receive severity colors.

-- Main diagnostic groups: do not recolor source code.
for _, severity in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  set("Diagnostic" .. severity, {
    fg = "NONE",
    bg = "NONE",
  })

  set("DiagnosticUnderline" .. severity, {
    underline = false,
    undercurl = false,
    sp = "NONE",
  })
end

-- Inline diagnostic messages
set("DiagnosticVirtualTextError", {
  fg = c.error,
  bg = c.bg_dark,
})

set("DiagnosticVirtualTextWarn", {
  fg = c.yellow,
  bg = c.bg_dark,
})

set("DiagnosticVirtualTextInfo", {
  fg = c.blue,
  bg = c.bg_dark,
})

set("DiagnosticVirtualTextHint", {
  fg = c.cyan,
  bg = c.bg_dark,
})

-- Diagnostic signs in the sign column
set("DiagnosticSignError", { fg = c.error })
set("DiagnosticSignWarn", { fg = c.yellow })
set("DiagnosticSignInfo", { fg = c.blue })
set("DiagnosticSignHint", { fg = c.cyan })

-- Floating diagnostic windows
set("DiagnosticFloatingError", { fg = c.error })
set("DiagnosticFloatingWarn", { fg = c.yellow })
set("DiagnosticFloatingInfo", { fg = c.blue })
set("DiagnosticFloatingHint", { fg = c.cyan })

-- Prevent additional diagnostic modifiers from changing code appearance
set("DiagnosticDeprecated", {})
set("DiagnosticUnnecessary", {})

-- Completion and floating menus
bg("Pmenu", c.bg_dark)
fg("Pmenu", c.fg)
bg("PmenuSel", c.bg_selected)
fg("PmenuSel", c.purple_light, { bold = true })
fg("PmenuSbar", c.bg_dark)
bg("PmenuThumb", c.purple)

fg("MatchParen", c.purple_light, { bold = true })
fg("WinSeparator", "#202635")
fg("VertSplit", "#202635")

-- -- Neo-tree
-- bg("NeoTreeNormal", c.bg_sidebar)
-- bg("NeoTreeNormalNC", c.bg_sidebar)
-- bg("NeoTreeEndOfBuffer", c.bg_sidebar)
-- fg("NeoTreeDirectoryName", c.fg_dim)
-- fg("NeoTreeDirectoryIcon", c.purple)
-- fg("NeoTreeRootName", c.purple_light, { bold = true })
-- fg("NeoTreeFileName", c.fg)
-- fg("NeoTreeFileIcon", c.blue)
-- fg("NeoTreeGitAdded", "#C3E88D")
-- fg("NeoTreeGitModified", "#C792EA")
-- fg("NeoTreeGitDeleted", c.red_alt)
-- fg("NeoTreeGitUntracked", c.green_light)
-- bg("NeoTreeCursorLine", c.bg_selected)
-- Neo-tree
bg("NeoTreeNormal", c.bg_sidebar)
bg("NeoTreeNormalNC", c.bg_sidebar)
bg("NeoTreeEndOfBuffer", c.bg_sidebar)

fg("NeoTreeDirectoryName", c.purple_light)
fg("NeoTreeDirectoryIcon", c.purple)
fg("NeoTreeRootName", c.purple_light, { bold = true })

fg("NeoTreeFileName", c.fg)
fg("NeoTreeFileNameOpened", c.purple_light)

fg("NeoTreeFileIcon", c.blue_light)

fg("NeoTreeGitAdded", "#C3E88D")
fg("NeoTreeGitModified", "#C792EA")
fg("NeoTreeGitDeleted", c.red_alt)
fg("NeoTreeGitUntracked", c.green_light)

bg("NeoTreeCursorLine", c.bg_selected)

-- Telescope
bg("TelescopeNormal", c.bg_dark)
bg("TelescopeBorder", c.bg_dark)
fg("TelescopeBorder", c.purple)
bg("TelescopePromptNormal", c.bg_input)
fg("TelescopePromptPrefix", c.purple)
bg("TelescopeSelection", c.bg_selected)
fg("TelescopeSelection", c.purple_light)
fg("TelescopeMatching", c.purple_light, { bold = true })

-- Status line / tab line
bg("StatusLine", c.bg_dark)
fg("StatusLine", c.fg)
bg("StatusLineNC", c.bg_dark)
fg("StatusLineNC", c.fg_dim)

bg("TabLine", c.bg_dark)
fg("TabLine", c.fg_dim)
bg("TabLineSel", c.bg_selected)
fg("TabLineSel", c.purple_light, { bold = true })
bg("TabLineFill", c.bg_dark)

-- Git signs
fg("GitSignsAdd", "#C3E88D")
fg("GitSignsChange", "#C792EA")
fg("GitSignsDelete", c.red_alt)

-- Which-key
bg("WhichKeyFloat", c.bg_dark)
fg("WhichKey", c.purple_light)
fg("WhichKeyGroup", c.orange)
fg("WhichKeyDesc", c.fg)
fg("WhichKeySeparator", c.comment)

-- Misc UI
fg("Title", c.purple_light, { bold = true })
fg("Directory", c.blue_light)
fg("Question", c.green_light)
fg("MoreMsg", c.green_light)
fg("ModeMsg", c.purple_light)
fg("WarningMsg", c.yellow)
fg("ErrorMsg", c.error)
fg("Folded", c.comment, { italic = true })
bg("Folded", c.bg_dark)
fg("SpellBad", c.error, { undercurl = true })
fg("SpellCap", c.yellow, { undercurl = true })
fg("SpellRare", c.purple, { undercurl = true })
fg("SpellLocal", c.cyan, { undercurl = true })

-- Terminal ANSI palette
vim.g.terminal_color_0 = c.bg_dark
vim.g.terminal_color_1 = c.red_alt
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.fg

vim.g.terminal_color_8 = c.comment
vim.g.terminal_color_9 = c.red
vim.g.terminal_color_10 = c.green_light
vim.g.terminal_color_11 = "#FFCB6B"
vim.g.terminal_color_12 = c.blue_light
vim.g.terminal_color_13 = "#C792EA"
vim.g.terminal_color_14 = c.teal
vim.g.terminal_color_15 = "#FFFFFF"

-- Diagnostic display configuration
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    spacing = 2,
    prefix = "●",
    source = "if_many",
  },

  virtual_lines = false,

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },

  underline = false,
  update_in_insert = false,
  severity_sort = true,
})
