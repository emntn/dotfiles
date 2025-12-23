return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      enabled = function() return not vim.tbl_contains({ "text", "markdown" }, vim.bo.filetype) end,
      keymap = {
        preset = 'default',
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_next()
            end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<S-Tab>'] = {
          function(cmp)
            return cmp.select_prev()
          end,
          'snippet_backward', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = {
              { "label", gap = 1 },
              { "kind" }
            },
          }
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets' },
      },
    },
    opts_extend = { "sources.default" }
  }
}
