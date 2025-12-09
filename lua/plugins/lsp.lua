return {
  'neovim/nvim-lspconfig',
  opts = {
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      underline = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
      virtual_text = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
    },
    servers = {
      vtsls = {
        settings = {
          typescript = {
            suggest = {
              autoImports = true,
              completeFunctionCalls = false,
            },
          },
          javascript = {
            suggest = {
              autoImports = true,
              completeFunctionCalls = false,
            },
          },
        },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { 'twMerge', 'cva', 'tv' },
            classAttributes = { 'class', 'className', 'ngClass', 'class:list', 'ui' },
          },
        },
      },
    },
  },
  config = function()
    vim.lsp.inlay_hint.enable(false)

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        }
      },
      underline = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
      virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '●',
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- prefix = "icons",
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
      severity_sort = true,
    })

    vim.lsp.config('*', {
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
    })
  end,
}
