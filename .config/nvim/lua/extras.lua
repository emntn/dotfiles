-- Telescope settings
require('telescope').load_extension('fzy_native')

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

require("telescope").load_extension("ui-select")

-- Autopairs
require("nvim-autopairs").setup {}
local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require("nvim-autopairs.conds")
autopairs.add_rules {
  Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts) return opts.char == ">" end),
}

-- Lualine
local function getWords()
  local validFileTypes = { md = true, txt = true, markdown = true }

  if validFileTypes[vim.bo.filetype] then
    return vim.fn.wordcount().words .. " words"
  else
    return ""
  end
end

local function progress()
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')
  return string.format('%2d%%%%', math.floor(cur / total * 100))
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename', 'diagnostics', 'diff' },
    lualine_x = { 'encoding', 'filetype', { getWords } },
    lualine_y = { { progress } },
    lualine_z = { 'location' }
  },
  inactive_sections = {},
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
