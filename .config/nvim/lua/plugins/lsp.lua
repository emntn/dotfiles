return {
  {
    "neovim/nvim-lspconfig",
    config = function()
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

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          if not (ev.data and ev.data.client_id) then
            return
          end

          local bufnr = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          require('lsp-inlayhints').on_attach(client, bufnr)
          -- Enable built-in inlay hints
          --vim.lsp.inlay_hint.enable(true, { bufnr = bufnr, client = client })

          local opts = { buffer = ev.buf }
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>de', builtin.lsp_definitions, opts)
          vim.keymap.set('n', '<leader>im', builtin.lsp_implementations, opts)
          vim.keymap.set('n', '<leader>dt', builtin.lsp_type_definitions, opts)
          vim.keymap.set('n', '<leader>di', builtin.diagnostics, opts)
          vim.keymap.set('n', '<leader>re', builtin.lsp_references, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        end,
      })

      local lspconfig = require('lspconfig')

      -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
              -- parameterNames = true ,
              rangeVariableTypes = true,
            }
          },
        }
      }

      lspconfig.tsserver.setup {
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
    end
  }
}
