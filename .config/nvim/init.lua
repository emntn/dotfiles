vim.opt.termguicolors = true
vim.env["NVIM_TUI_ENABLE_TRUE_COLOR"] = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",
  {
    ui = {
      icons = {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  }
)
require("extras")
require("lsp")
require("mappings")

vim.opt.updatetime = 50

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Disable cursor changing in insert mode
vim.opt.guicursor = ""

-- Configure title to show filename and flags
vim.opt.titlestring = "%t  %r%m"
vim.opt.titlelen = 50

-- Hide foldcolumn
vim.o.foldenable = false

-- Format on save if the language server supports formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local bufnr = vim.fn.bufnr()
    local clients = vim.lsp.buf_get_clients(bufnr)
    if #clients > 0 and clients[1].supports_method("textDocument/formatting") then
      vim.lsp.buf.format()
    end
  end,
})

-- Split windows
vim.opt.fillchars = { vert = '│' }
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.completeopt = 'menu,menuone,noselect,noinsert'
vim.opt.signcolumn = 'number'

-- Enable use of the mouse for all modes
vim.opt.mouse = 'a'

-- 1 tab is 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- disable folding
vim.opt.foldenable = false

-- Colorcolumn
vim.opt.colorcolumn = { 80 }

-- Highlight current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Turn backup off
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.smartindent = true
vim.opt.wrap = false

-- vim.opt.utf8 as standard encoding
vim.opt.encoding = 'utf-8'

-- Ignore casing of normal letters
vim.opt.ignorecase = true

-- Ignore casing when using lowercase letters only
vim.opt.smartcase = true

vim.opt.breakindent = true
vim.opt.linebreak = true

-- Show line nubmers
vim.opt.number = true

-- Show tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = "tab:⟶·,trail:·,multispace:··"

-- enable setting title
vim.opt.title = true

-- Always display the status line, even if only one window is displayed
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.showcmd = false

-- File explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
