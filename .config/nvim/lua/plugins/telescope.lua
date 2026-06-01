return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup {
        defaults = {
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
      local map = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = desc })
      end

      local builtin = require('telescope.builtin')
      map('<leader>ff', builtin.find_files, 'Find Files')
      map('<leader>fs', builtin.spell_suggest, 'Spell Suggest')
      map('<leader>fg', builtin.live_grep, 'Live Grep')
      map('<leader>fb', builtin.buffers, 'Buffers')
      map('<leader>fh', builtin.help_tags, 'Help Tags')
      map('<leader>fc', builtin.git_bcommits, 'Buffer Commits')
      map('<leader>ft', builtin.builtin, 'Telescope Pickers')

      require('telescope').load_extension('fzy_native')
      require("telescope").load_extension("ui-select")
    end
  },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" }
}
