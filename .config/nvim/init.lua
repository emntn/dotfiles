vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Jump to last cursor position on file open, or scroll to today's date in journal files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local filepath = vim.fn.expand("%:p")
    local notes_path = vim.fn.expand("~/notes")
    -- First, restore cursor position for all files
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
    -- Check if it's a markdown file in ~/notes with today's date heading
    if filepath:match("^" .. notes_path) and filepath:match("%.md$") then
      local today = os.date("## %a %d-%m-%Y")
      local found = vim.fn.search("^" .. today .. "$", "w")
      if found > 0 then
        vim.cmd("normal! zt")                -- Scroll today's heading to top
        vim.api.nvim_win_set_cursor(0, mark) -- Return to previous cursor position
        return
      end
    end
    -- For all other files, center the cursor position
    vim.cmd("normal! zz")
  end,
})
