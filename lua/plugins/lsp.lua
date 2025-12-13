return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.inlay_hint.enable(false)

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        },
      },
      virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '',
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- prefix = "icons",
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

    vim.lsp.config('vtsls', {
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })
  end,
}
