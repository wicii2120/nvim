---@module 'conform'
return {
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    opts = function()
      local prettier_ft = {
        'typescript',
        'javascript',
        'typescriptreact',
        'javascriptreact',
        'css',
        'html',
        'vue',
        'json',
        'yaml',
      }
      local formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        go = { 'gofmt' },
        sh = { 'shfmt' },
      }

      for _, ft in ipairs(prettier_ft) do
        formatters_by_ft[ft] = { 'prettier' }
      end

      ---@type conform.setupOpts
      return {
        format_on_save = {
          timeout_ms = 1000,
        },
        formatters_by_ft = formatters_by_ft,
      }
    end,
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
