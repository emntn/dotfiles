return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('gruvbox_material_custom', {}),
        pattern = 'gruvbox-material',
        callback = function()
          local palette = vim.fn['gruvbox_material#get_palette']('hard', 'material', { bg1 = { '#202020', '234' } })
          local hl = vim.api.nvim_set_hl
          local set_hl = vim.fn['gruvbox_material#highlight']

          hl(0, 'TSString', { link = 'String' })
          hl(0, 'CocSymbolString', { link = 'String' })
          hl(0, 'javascriptPropertyNameString', { link = 'String' })
          hl(0, 'typescriptStringProperty', { link = 'String' })
          hl(0, 'cmakeKWstring', { link = 'String' })

          hl(0, 'TSType', { link = 'BlueItalic' })
          hl(0, 'TSTypeBuiltin', { link = 'BlueItalic' })
          hl(0, 'TSTypeDefinition', { link = 'BlueItalic' })
          hl(0, 'TSNamespace', { link = 'PurpleItalic' })

          hl(0, 'mkdHeading', { link = 'Yellow' })
          hl(0, 'mkdListItem', { link = 'Fg' })
          hl(0, 'mkdBold', { link = 'Fg' })
          hl(0, 'mkdCodeDelimiter', { link = 'Green' })
          hl(0, 'mkdCode', { link = 'Green' })
          hl(0, 'mkdListItemCheckbox', { link = 'Fg' })

          set_hl('String', palette.yellow, palette.none)
          set_hl('markdownH1', palette.yellow, palette.none, 'bold')
          set_hl('markdownH2', palette.yellow, palette.none, 'bold')
          set_hl('markdownH3', palette.yellow, palette.none, 'bold')
          set_hl('markdownH4', palette.yellow, palette.none, 'bold')
          set_hl('markdownH5', palette.yellow, palette.none, 'bold')
          set_hl('markdownH6', palette.yellow, palette.none, 'bold')
          set_hl('htmlH1', palette.yellow, palette.none, 'bold')
          set_hl('htmlH2', palette.yellow, palette.none, 'bold')
          set_hl('htmlH3', palette.yellow, palette.none, 'bold')
          set_hl('htmlH4', palette.yellow, palette.none, 'bold')
          set_hl('htmlH5', palette.yellow, palette.none, 'bold')
          set_hl('htmlH6', palette.yellow, palette.none, 'bold')
          set_hl('Comment', palette.grey0, palette.none, 'italic')
          set_hl('LspInlayHint', palette.bg5, palette.none, 'italic')
          set_hl('IndentBlankline', palette.bg5, palette.none)
          set_hl('Special', palette.blue, palette.none)
          set_hl('Pmenu', palette.fg1, palette.bg1)
          set_hl('PmenuSel', palette.fg1, palette.bg3)
          set_hl('PmenuSbar', palette.none, palette.bg1)
          set_hl('PmenuThumb', palette.none, palette.bg3)
          set_hl('NormalFloat', palette.fg1, palette.bg1)
          set_hl('FloatBorder', palette.grey1, palette.bg1)
          set_hl('FloatTitle', palette.orange, palette.bg1, 'bold')
        end
      })

      vim.opt.background = 'dark'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_spell_foreground = 'colored'
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_disable_terminal_colors = 1
      vim.g.gruvbox_material_float_style = 'dim'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
