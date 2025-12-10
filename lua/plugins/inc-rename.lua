return {
  'smjonas/inc-rename.nvim',
  opts = {},
  cmd = { 'IncRename' },
  keys = {
    {
      '<leader>cr',
      function()
        vim.api.nvim_feedkeys(':IncRename ' .. vim.fn.expand('<cword>'), 'n', true)
      end,
    },
  },
}
