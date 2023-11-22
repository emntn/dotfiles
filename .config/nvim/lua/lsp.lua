local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'path' },                    -- file paths
    { name = 'nvim_lsp' },                -- from language server
    { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
    { name = 'nvim_lua' },                -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer' },                  -- source current buffer
    { name = 'vsnip' },                   -- nvim-cmp source for vim-vsnip
    { name = 'calc' },                    -- source for math calculation
  },
  window = {
    documentation = {
      max_width = 80,
    }
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { width = 80 }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { width = 80 }),
}

require("lsp-inlayhints").setup(
  {
    inlay_hints = {
      parameter_hints = {
        remove_colon_start = true,
      },
      -- type and other hints
      type_hints = {
        prefix = "=> ",
        remove_colon_start = true,
      },
    },
  }
)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
  desc = "lsp-inlayhints",
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Enable native inlay hints if client supports them
  --  if client.supports_method("textDocument/inlayHint") then
  --    vim.lsp.buf.inlay_hint(bufnr, true)
  --  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { 'bashls', 'cssls', 'html', 'lua_ls', 'vimls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    handlers = handlers,
    capabilities = capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          extendSelect = { "I" },
        },
      }
    }
  }
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      },
      inlayHints = {
        parameterHints = false,
      }
    }
  }
}


lspconfig.gopls.setup {
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        -- parameterNames = true ,
        rangeVariableTypes = true,
      }
    },
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities,
  settings = {
    typescript = {
      format = {
        indentSize = 2,
        semicolons = 'remove',
        tabSize = 2,
      },
      inlayHints = {
        -- includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      format = {
        indentSize = 2,
        semicolons = 'remove',
        tabSize = 2,
      },
      inlayHints = {
        -- includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    border = 'none',
    source = 'always',
    header = '',
    prefix = '',
    width = 100,
  },
})
