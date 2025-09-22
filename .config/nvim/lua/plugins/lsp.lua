return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      -- LSP settings (for overriding per client)
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { width = 80 }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { width = 80 }),
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          if not (ev.data and ev.data.client_id) then
            return
          end

          local opts = { buffer = ev.buf }
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, opts)
          vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, opts)
          vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, opts)
          vim.keymap.set('n', '<leader>gI', builtin.diagnostics, opts)
          vim.keymap.set('n', '<leader>gr', builtin.lsp_references, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        end,
      })

      -- Enable completion with blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = { 'bashls', 'cssls', 'html', 'lua_ls', 'vimls' }
      for _, lsp in ipairs(servers) do
        vim.lsp.enable(lsp, {
          handlers = handlers,
          capabilities = capabilities,
        })
      end

      vim.lsp.config("pylsp", {
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              ruff = {
                enabled = true,
                extendSelect = { "I" },
              },
            },
          },
        },
      })
      vim.lsp.enable("pylsp")

      vim.lsp.config("clangd", {
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          InlayHints = {
            Enabled = true,
          },
        },
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("gopls", {
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              constantValues = true,
              functionTypeParameters = true,
              rangeVariableTypes = true,
            },
          },
        },
      })
      vim.lsp.enable("gopls")

      vim.lsp.config("rust_analyzer", {
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            inlayHints = {
              parameterHints = false,
            },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      vim.lsp.config("ts_ls", {
        handlers = handlers,
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        settings = {
          typescript = {
            format = {
              indentSize = 2,
              semicolons = 'remove',
              tabSize = 2,
            },
            inlayHints = {
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
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          }
        }
      })
      vim.lsp.enable("ts_ls")

      vim.diagnostic.config({
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN]  = "●",
            [vim.diagnostic.severity.INFO]  = "●",
            [vim.diagnostic.severity.HINT]  = "●",
          },
        },
        float = {
          border = 'none',
          source = 'always',
          header = '',
          prefix = '',
          width = 100,
        },
      })
    end
  }
}
