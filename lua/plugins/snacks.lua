return {
  'folke/snacks.nvim',
  ---@type snacks.config
  opts = {
    picker = {
      ---@type snacks.picker.previewers.Config
      previewers = {
        diff = {
          builtin = false,
          cmd = { 'delta' },
        },
        git = {
          builtin = false,
        },
      },
    },
    animate = {
      easing = 'inOutQuart',
      duration = {
        total = 200,
      },
    },
    explorer = {
      replace_netrw = false,
      trash = true,
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
