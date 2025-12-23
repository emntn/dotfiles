return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.o.background = 'dark'
    require('solarized').setup({
      transparent = {
        enabled = true,
        pmenu = false,
        normal = false,
        normalfloat = false,
        neotree = true,
        nvimtree = true,
        whichkey = true,
        telescope = true,
        lazy = false,
      },
      on_highlights = nil,
      on_colors = nil,
      palette = 'solarized', -- solarized (default) | selenized
      variant = 'winter',    -- "spring" | "summer" | "autumn" | "winter" (default)
      error_lens = {
        text = false,
        symbol = false,
      },
      styles = {
        enabled = true,
        types = { bold = false },
        functions = { bold = false },
        parameters = { bold = false },
        comments = { bold = false },
        strings = { bold = false },
        keywords = { bold = false },
        variables = { bold = false },
        constants = { bold = false },
      },
      plugins = {
        treesitter = true,
        lspconfig = true,
        navic = true,
        cmp = true,
        indentblankline = true,
        neotree = true,
        nvimtree = true,
        whichkey = true,
        dashboard = true,
        gitsigns = true,
        telescope = true,
        noice = true,
        hop = true,
        ministatusline = true,
        minitabline = true,
        ministarter = true,
        minicursorword = true,
        notify = true,
        rainbowdelimiters = true,
        bufferline = true,
        lazy = true,
        rendermarkdown = true,
        ale = true,
        coc = true,
        leap = true,
        alpha = true,
        yanky = true,
        gitgutter = true,
        mason = true,
        flash = true,
      },
    })
    --    vim.cmd.colorscheme 'solarized'
  end,
}
