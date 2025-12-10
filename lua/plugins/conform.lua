return {
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      format_on_save = {
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        vue = { 'prettier' },
        lua = { 'stylua' },
        python = { 'ruff' },
        go = { 'gofmt' },
        sh = { 'shfmt' },
      },
    },
    keys = {
      {
        '<leader>cF',
        function()
          require('conform').format({ formatters = { 'injected' } })
        end,
        mode = { 'n', 'x' },
        desc = 'Format Injected Langs',
      },
      {
        '<leader>cf',
        function()
          require('conform').format()
        end,
        mode = { 'n', 'x' },
        desc = 'Format Buffer',
      },
    },
    event = { 'BufWritePre' },
  },
}
