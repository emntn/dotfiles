return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension('fzy_native')
      require("telescope").load_extension("ui-select")

      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = {
          layout_config = {
            horizontal = {
              height = 0.9,
              preview_cutoff = 160,
              prompt_position = "bottom",
              width = 0.9
            }
          },
          mappings = {
            i = {
              ["<C-l>"] = actions.select_vertical
            },
            n = {
              ["<C-l>"] = actions.select_vertical
            },
          },
        },
        extensions = {
          -- Use Telescope for Neovim core stuff like code actions etc...
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fr', builtin.spell_suggest, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }
}
