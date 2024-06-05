return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
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
    end
  }
}
