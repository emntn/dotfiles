vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

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
            highlight! link mkdHeading Yellow
            highlight! link mkdListItem Fg
            highlight! link mkdBold Fg
            highlight! link mkdCodeDelimiter Green
            highlight! link mkdListItemCheckbox Fg
            highlight! link TSType BlueItalic
            highlight! link TSTypeBuiltin BlueItalic
            highlight! link TSTypeDefinition BlueItalic
            highlight! link TSNamespace PurpleItalic

            let l:palette = gruvbox_material#get_palette('hard', 'original', {})

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
            call gruvbox_material#highlight('Pmenu', l:palette.fg1, l:palette.bg_dim)
            call gruvbox_material#highlight('PmenuSel', l:palette.fg1, l:palette.bg3)
            call gruvbox_material#highlight('PmenuSbar', l:palette.none, l:palette.none)
            call gruvbox_material#highlight('PmenuThumb', l:palette.none, l:palette.bg3)
        endfunction

        augroup GruvboxMaterialCustom
            autocmd!
            autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
        augroup END
      ]]
      vim.opt.background = 'dark'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'highlighted'
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_spell_foreground = 'colored'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_disable_terminal_colors = 1
      vim.g.gruvbox_material_float_style = 'dim'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        integrations = {
          cmp = true,
          telescope = true,
        },
      })
    end,
  },

  {
    "preservim/vim-markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_autowrite = 1
      vim.g.vim_markdown_edit_url_in = 'tab'
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.tex_conceal = ""
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
    end,
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "neovim/nvim-lspconfig" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.install').compilers = { 'gcc' }
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "javascript", "lua", "python", "rust", "tsx", "typescript", },
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "markdown" },
        }
      }
    end
  },

  { "windwp/nvim-autopairs" },

  -- Completion framework
  { "hrsh7th/nvim-cmp" },

  -- LSP completion source:
  { "hrsh7th/cmp-nvim-lsp" },

  -- Useful completion sources:
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/vim-vsnip" },

  -- Inlay hints
  { "lvimuser/lsp-inlayhints.nvim" },

  -- lualine
  { "nvim-lualine/lualine.nvim" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        stages = "fade",
      })
      require("noice").setup({
        cmdline = {
          format = {
            cmdline = { icon = ">" },
            search_down = { icon = "🔍⌄" },
            search_up = { icon = "🔍⌃" },
            filter = { icon = "$" },
            lua = { icon = "☾" },
            help = { icon = "?" },
          },
        },
        format = {
          level = {
            icons = {
              error = "✖",
              warn = "▼",
              info = "●",
            },
          },
        },
        popupmenu = {
          kind_icons = false,
        },
        inc_rename = {
          cmdline = {
            format = {
              IncRename = { icon = "⟳" }
            },
          },
        },
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      })
    end
  }
}
