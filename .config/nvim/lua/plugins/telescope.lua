return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = require('telescope.themes').get_ivy {
          layout_config = { height = 0.5 },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<C-l>"] = actions.select_vertical,
              ["<esc>"] = actions.close
            },
            n = {
              ["<C-l>"] = actions.select_vertical
            },
          },
        },
        extensions = {
          -- Use Telescope for Neovim core stuff like code actions etc...
          ["ui-select"] = {
            require("telescope.themes").get_cursor {}
          }
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fc', builtin.git_bcommits, {})
      vim.keymap.set('n', '<leader>ft', builtin.builtin, {})

      require('telescope').load_extension('fzy_native')
      require("telescope").load_extension("ui-select")
    end
  },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }
}
