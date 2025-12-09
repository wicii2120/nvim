return {
  'nvim-mini/mini.diff',
  version = false,
  opts = {},
  keys = {
    {
      '<leader>go',
      function()
        MiniDiff.toggle_overlay(0)
      end,
      desc = 'Toggle MiniDiff Overlay',
    },
  },
  event = { 'BufEnter' },
}
