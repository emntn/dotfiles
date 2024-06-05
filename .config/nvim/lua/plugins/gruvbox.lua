return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[
        function! s:gruvbox_material_custom() abort

            highlight! link TSString String
            highlight! link CocSymbolString String
            highlight! link javascriptPropertyNameString String
            highlight! link typescriptStringProperty String
            highlight! link cmakeKWstring String

            highlight! link TSType BlueItalic
            highlight! link TSTypeBuiltin BlueItalic
            highlight! link TSTypeDefinition BlueItalic
            highlight! link TSNamespace PurpleItalic

            highlight! link mkdHeading Yellow
            highlight! link mkdListItem Fg
            highlight! link mkdBold Fg
            highlight! link mkdCodeDelimiter Green
            highlight! link mkdCode Green
            highlight! link mkdListItemCheckbox Fg

            let l:palette = gruvbox_material#get_palette('hard', 'material', {'bg1': ['#202020', '234'],})

            call gruvbox_material#highlight('String', l:palette.yellow, l:palette.none)
            call gruvbox_material#highlight('markdownH1', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('markdownH2', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('markdownH3', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('markdownH4', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('markdownH5', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('markdownH6', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH1', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH2', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH3', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH4', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH5', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('htmlH6', l:palette.yellow, l:palette.none, 'bold')
            call gruvbox_material#highlight('Comment', l:palette.grey0, l:palette.none, 'italic')
            call gruvbox_material#highlight('LspInlayHint', l:palette.bg5, l:palette.none, 'italic')
            call gruvbox_material#highlight('IndentBlankline', l:palette.bg5, l:palette.none)
            call gruvbox_material#highlight('Special', l:palette.blue, l:palette.none)
            call gruvbox_material#highlight('Pmenu', l:palette.fg1, l:palette.bg1)
            call gruvbox_material#highlight('PmenuSel', l:palette.fg1, l:palette.bg3)
            call gruvbox_material#highlight('PmenuSbar', l:palette.none, l:palette.bg1)
            call gruvbox_material#highlight('PmenuThumb', l:palette.none, l:palette.bg3)
            call gruvbox_material#highlight('NormalFloat', l:palette.fg1, l:palette.bg1)
            call gruvbox_material#highlight('FloatBorder', l:palette.grey1, l:palette.bg1)
            call gruvbox_material#highlight('FloatTitle', l:palette.orange, l:palette.bg1, 'bold')
        endfunction

        augroup GruvboxMaterialCustom
            autocmd!
            autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
        augroup END
      ]]
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
  }
}
