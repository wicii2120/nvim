return {
  'smjonas/inc-rename.nvim',
  enabled = false,
  opts = {},
  cmd = { 'IncRename' },
  keys = {
    {
      '<leader>cr',
      function()
        return ':IncRename ' .. vim.fn.expand('<cword>')
      end,
      expr = true,
      desc = 'Inc-Rename',
    },
  },
}
