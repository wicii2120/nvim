---@type LazySpec
return {
  'folke/snacks.nvim',
  ---@type snacks.config
  opts = {
    picker = {
      previewers = {
        diff = {
          builtin = false,
          cmd = { 'diff-so-fancy' },
        },
      },
    },
    animate = {
      easing = 'inOutQuart',
      duration = {
        total = 200,
      },
    },
  },
  keys = {
    {
      '<C-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Terminal (cwd)',
      mode = { 'n', 't' },
    },
  },
}
