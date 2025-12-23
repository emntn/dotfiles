return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('kanagawa').setup({
        statementStyle = { bold = false },
        keywordStyle = { italic = false },
        transparent = false,
        colors = {
          palette = { dragonWhite = "#a69f94" },
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require("kanagawa.lib.color")
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end
          return {
            -- UI
            Pmenu                          = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel                       = { fg = "none", bg = theme.ui.bg_p2 },
            PmenuSbar                      = { bg = theme.ui.bg_m1 },
            PmenuThumb                     = { bg = theme.ui.bg_p2 },
            CursorLineNr                   = { fg = theme.ui.nontext, bg = theme.ui.bg_gutter, bold = true },
            NormalFloat                    = { bg = "none" },
            FloatBorder                    = { fg = theme.ui.nontext, bg = "none" },
            FloatTitle                     = { bg = "none" },
            TelescopePromptNormal          = { fg = theme.ui.fg, bg = "none" },
            TelescopePromptBorder          = { fg = theme.ui.nontext, bg = "none" },
            TelescopeResultsNormal         = { fg = theme.ui.fg, bg = "none" },
            TelescopeResultsBorder         = { fg = theme.ui.nontext, bg = "none" },
            TelescopePreviewNormal         = { fg = theme.ui.fg, bg = "none" },
            TelescopePreviewBorder         = { fg = theme.ui.nontext, bg = "none" },
            NoiceCmdlineIcon               = { fg = theme.ui.nontext, bg = "none" },
            NoiceCmdlineIconInput          = { fg = theme.ui.nontext, bg = "none" },
            NoiceCmdlineIconSearch         = { fg = theme.diag.warning, bg = "none" },
            NoiceCmdlinePopupBorder        = { fg = theme.diag.info, bg = "none" },
            NoiceCmdlinePopupBorderSearch  = { fg = theme.diag.warning, bg = "none" },
            NoiceCmdlinePopupTitle         = { fg = theme.diag.info, bg = "none" },
            NoiceConfirmBorder             = { fg = theme.diag.info, bg = "none" },
            NoiceCmdlinePopup              = { fg = theme.diag.info, bg = "none" },
            NoiceCmdlinePopupBorderCmdline = { fg = theme.diag.info, bg = "none" },
            WinSeparator                   = { fg = theme.ui.bg_p2 },
            EndOfBuffer                    = { fg = theme.ui.bg_p2 },
            -- Syntax
            LspInlayHint                   = { bg = "none", fg = theme.ui.bg_p2 },
            Comment                        = { bg = "none", fg = theme.ui.nontext },
            Boolean                        = { fg = theme.syn.constant, bold = false },
            ["@keyword.operator"]          = { fg = theme.syn.operator, bold = false },
            ["@string.escape"]             = { fg = theme.syn.regex, bold = false },
            DiagnosticVirtualTextHint      = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo      = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn      = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError     = makeDiagnosticColor(theme.diag.error),
          }
        end,
        theme = "dragon",
        background = {
          dark = "dragon",
        },
      })
      --      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
