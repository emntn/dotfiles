return {
  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'

      cmp.setup({
        formatting = {
          format = require("nvim-highlight-colors").format
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(),
          ['<Down>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-l>'] = cmp.mapping.scroll_docs(-4),
          ['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        sources = {
          { name = 'path' },                    -- file paths
          { name = 'nvim_lsp' },                -- from language server
          { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
          { name = 'nvim_lua' },                -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'buffer' },                  -- source current buffer
          { name = 'vsnip' },                   -- nvim-cmp source for vim-vsnip
          { name = 'calc' },                    -- source for math calculation
        },
        window = {
          documentation = {
            max_width = 80,
          }
        },
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  -- LSP completion source:
  { "hrsh7th/cmp-nvim-lsp" },

  -- Useful completion sources:
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/vim-vsnip" },
}
