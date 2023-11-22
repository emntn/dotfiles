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

vim.cmd [[
" Go tabbing
au BufNewFile,BufRead *.go set filetype=go
autocmd filetype go setlocal tabstop=4
autocmd filetype go setlocal softtabstop=4
autocmd filetype go setlocal shiftwidth=4
autocmd filetype go setlocal expandtab

" Filetype spesific settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd filetype markdown setlocal nonumber
autocmd filetype markdown setlocal spell spelllang=en
autocmd filetype markdown set textwidth=80
autocmd filetype markdown set colorcolumn=
autocmd filetype markdown set nolist
" Fix wrapping lists with gq
"autocmd FileType markdown set comments=fb:*,fb:+,fb:-,n:> indentexpr=
]]

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

-- 1 tab is 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
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
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.si = true
vim.opt.wrap = true

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
