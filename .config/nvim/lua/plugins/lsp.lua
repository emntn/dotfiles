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

      local lspconfig = require('lspconfig')

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = { 'bashls', 'cssls', 'html', 'lua_ls', 'vimls' }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          handlers = handlers,
          capabilities = capabilities,
        }
      end

      lspconfig.pylsp.setup {
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

      lspconfig.clangd.setup {
        handlers = handlers,
        capabilities = capabilities,
        settings = {
          InlayHints = {
            Enabled = true
          }
        }
      }


      lspconfig.rust_analyzer.setup {
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
            }
          },
        }
      }

      lspconfig.ts_ls.setup {
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
      }

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
