return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          if not (ev.data and ev.data.client_id) then
            return
          end

          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, {
              buffer = ev.buf,
              desc = desc,
            })
          end

          local builtin = require('telescope.builtin')
          map('<leader>gd', builtin.lsp_definitions, 'Goto Definition')
          map('<leader>gD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('<leader>gi', builtin.lsp_implementations, 'Goto Implementation')
          map('<leader>gt', builtin.lsp_type_definitions, 'Goto Type Definition')
          map('<leader>gr', builtin.lsp_references, 'References')
          map('<leader>gI', builtin.diagnostics, 'Diagnostics')
          map('<leader>ga', vim.lsp.buf.code_action, 'Code Action')
          map('<leader>rn', vim.lsp.buf.rename, 'Rename')
          map('<leader>e', vim.diagnostic.open_float, 'Line Diagnostics')
          map('<space>q', vim.diagnostic.setloclist, 'Diagnostics List')
        end,
      })

      -- Enable completion with blink
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local servers = { "bashls", "cssls", "html", "lua_ls", "vimls", }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, capabilities)
        vim.lsp.enable(server)
      end

      vim.lsp.config("pylsp", {
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
        capabilities = capabilities,
        settings = {
          InlayHints = {
            Enabled = true,
          },
        },
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("gopls", {
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
