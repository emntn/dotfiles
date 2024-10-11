return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {
        "linrongbin16/lsp-progress.nvim",
        config = true,
      },
    },
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
          lualine_x = {
            {
              function()
                return require("lsp-progress").progress({
                  max_size = 80,
                  format = function(messages)
                    local active_clients =
                        vim.lsp.get_active_clients()
                    if #messages > 0 then
                      return table.concat(messages, " ")
                    end
                    local client_names = {}
                    for _, client in ipairs(active_clients) do
                      if client and client.name ~= "" then
                        table.insert(
                          client_names,
                          1,
                          client.name
                        )
                      end
                    end
                    return table.concat(client_names, " ")
                  end,
                })
              end,
            },
            'encoding', 'filetype', { getWords } },
          lualine_y = { { progress } },
          lualine_z = { 'location' }
        },
        inactive_sections = {},
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }

      -- listen lsp-progress event and refresh lualine
      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
      })
    end
  }
}
