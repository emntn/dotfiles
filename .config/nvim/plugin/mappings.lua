local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function cmap(shortcut, command)
  map('c', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- Unmap space in normal mode
nmap('<Space>', '<Nop>')

-- Map arrow keys to move naturally
imap('<Down>', '<C-o>gj')
imap('<Up>', '<C-o>gk')
nmap('<Down>', 'gj')
nmap('<Up>', 'gk')

-- Switch panes
nmap('<Leader>h', '<c-w>h')
nmap('<Leader>j', '<c-w>j')
nmap('<Leader>k', '<c-w>k')
nmap('<Leader>l', '<c-w>l')

-- Equal panes
nmap('<Leader>=', '<C-W>=')

-- Center screen on search result
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Insert bolded text with a timestamp and subject in markdown
imap('<F1>', '<C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>')
nmap('<F1>', 'i<C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>')

-- Insert a new todo template
imap('<F2>', '<C-R>="- [ ] "<CR><C-o>:cal cursor(0,10)<CR>')
nmap('<F2>', 'i<C-R>="- [ ] "<CR><C-o>:cal cursor(0,12)<CR>')

-- Insert heading with todays date in markdown
imap('<F3>', '<C-R>=strftime("### %d-%m-%Y")<CR>')
nmap('<F3>', 'i<C-R>=strftime("### %d-%m-%Y")<CR>')

-- Toggle todos done/undone
function ToggleTodo()
  local line = vim.fn.getline('.')
  local updated_line, _ = string.gsub(line, '%[%s?%w?%s?%]', function(match)
    if match == '[ ]' then
      return '[x]'
    elseif match == '[x]' then
      return '[ ]'
    else
      return match
    end
  end)

  if updated_line ~= line then
    vim.fn.setline('.', updated_line)
  end
end

vim.cmd([[
  autocmd FileType markdown nnoremap <silent> <buffer> <leader>x :lua ToggleTodo()<CR>
]])

-- Make "Y" yank till the end of line
nmap('Y', 'y$')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf ---@type number
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      vim.keymap.set('n', '<C-i>', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
          { bufnr = bufnr }
        )
      end, { buffer = bufnr })
    end
  end,
})
