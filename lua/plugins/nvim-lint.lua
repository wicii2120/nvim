return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      javascript = { 'oxlint', 'eslint' },
      typescript = { 'oxlint', 'eslint' },
      javascriptreact = { 'oxlint', 'eslint' },
      typescriptreact = { 'oxlint', 'eslint' },
    }

    local fts = vim.tbl_keys(lint)
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      pattern = fts,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
