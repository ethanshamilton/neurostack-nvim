---@diagnostic disable: undefined-global
local lush = require("lush")
local hsl = lush.hsl
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  -- your existing palette
  local bg = hsl(0, 0, 0)
  local fg = hsl(29, 40, 69)
  local gray = hsl(0, 0, 39)
  local orange = hsl(28, 100, 59)
  local rose = hsl(0, 42, 68)
  local blue = hsl(197, 37, 56)
  local purple = hsl(292, 37, 56)
  local warn = hsl(30, 80, 60)
  local error = hsl(0, 80, 60)

  return {
    -- base groups
    Normal({ bg = bg, fg = fg }),
    Comment({ fg = gray, gui = "italic" }),

    -- syntax (these are the OLD vim groups)
    Keyword({ fg = orange, gui = "bold" }),
    Function({ fg = rose }),
    String({ fg = blue }),
    Number({ fg = blue }),

    -- treesitter overrides (these take priority)
    sym("@module")({ fg = fg }),
    sym("@variable")({ fg = fg }), -- regular variables
    sym("@variable.builtin")({ fg = purple }), -- self, cls, etc
    sym("@variable.parameter")({ fg = purple }), -- function parameters

    sym("@function")({ fg = rose }), -- function names
    sym("@function.call")({ fg = rose }), -- function calls
    sym("@function.builtin")({ fg = purple }), -- print, len, etc
    sym("@function.method")({ fg = rose }), -- methods
    sym("@constructor")({ fg = rose }),

    sym("@keyword")({ fg = orange, gui = "bold" }), -- def, class, return, etc
    sym("@keyword.function")({ fg = orange }), -- def, lambda
    sym("@keyword.operator")({ fg = orange }), -- and, or, not
    sym("@keyword.return")({ fg = orange }),

    sym("@operator")({ fg = orange }), -- +, -, =, @
    sym("@punctuation.bracket")({ fg = orange }), -- (), [], {}
    sym("@punctuation.delimiter")({ fg = orange }), -- ,, ;
    sym("@punctuation.special")({ fg = orange }),
    sym("@string.escape")({ fg = purple }),

    sym("@string")({ fg = blue }),
    sym("@number")({ fg = blue }),
    sym("@boolean")({ fg = blue }),
    sym("@constant")({ fg = blue }),
    sym("@constant.builtin")({ fg = orange }),

    sym("@type")({ fg = rose }), -- class names
    sym("@type.builtin")({ fg = rose }), -- int, str, etc

    sym("@attribute")({ fg = orange }), -- decorators
    sym("@property")({ fg = rose }),

    -- markdown
    sym("@markup.heading")({ fg = orange, gui = "bold" }),
    sym("@markup.raw")({ fg = rose }),
    sym("@markup.raw.block")({ bg = gray.darken(70) }),
    sym("@markup.link")({ fg = blue, gui = "underline" }),
    sym("@markup.list")({ fg = orange }),

    -- HTML
    sym("@tag")({ fg = orange }),
    sym("@tag.builtin")({ fg = fg }),
    sym("@tag.attribute")({ fg = purple }),

    -- ui elements
    LineNr({ fg = gray }),
    CursorLine({ bg = bg.lighten(5) }),
    Visual({ bg = orange.darken(60) }),
    SnacksIndent({ fg = gray.darken(20) }),
    SnacksIndentScope({ fg = orange.darken(40) }),
    StatusLine({ bg = bg }),
    FloatBoader({ fg = orange }),
    MsgArea({ fg = fg, bg = bg }),
    CmdLine({ fg = fg, bg = bg }),
    Pmenu({ fg = fg }),
    PmenuSel({ bg = orange, fg = bg, gui = "bold" }),
    PmenuThumb({ bg = orange, fg = bg }),
    LspReferenceRead({ bg = blue.darken(40) }),
    LspReferenceWrite({ bg = purple.darken(50) }),

    -- git elements
    GitSignsAdd({ fg = purple.darken(30) }),
    GitSignsChange({ fg = blue.lighten(20) }),
    GitSignsDelete({ fg = rose.darken(20) }),

    -- snacks
    SnacksDashboardHeader({ fg = fg, gui = "bold" }),
    SnacksDashboardDesc({ fg = fg }),
    SnacksDashboardKey({ fg = orange, gui = "bold " }),
    SnacksDashboardIcon({ fg = orange }),
    SnacksNotifierTitle({ fg = orange, gui = "bold " }),
    SnacksNotifierFooter({ fg = fg }),
    SnacksPickerDirectory({ fg = fg }),
    SnacksPickerFile({ fg = fg }),
    SnacksPickerTitle({ fg = orange, gui = "bold" }),
    SnacksPickerBorder({ fg = orange }),

    -- noice command line
    NoiceCmdline({ fg = fg }),
    NoiceCmdlinePopup({ fg = fg }),
    NoiceCmdlinePopupBorder({ fg = orange }),
    NoiceCmdlineIcon({ fg = orange }),
    NoiceCmdlinePrompt({ fg = orange, gui = "bold " }),

    -- diagnostics
    DiagnosticError({ fg = error }),
    DiagnosticWarn({ fg = warn }),
    DiagnosticUnnecessary({ gui = "strikethrough" }),
    DiagnosticUnderlineError({ bg = rose.darken(60) }),
  }
end)
return theme
