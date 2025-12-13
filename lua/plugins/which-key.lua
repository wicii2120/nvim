return {
  'folke/which-key.nvim',
  opts = {
    preset = 'helix',
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>a', group = 'AI', icon = '󱚠' },
      },
      {
        mode = { 'n' },
        { '<leader>g', group = 'Git' },
        { '<leader>sn', group = 'Noice' },
        { '<leader>c', group = 'Code' },
        { '<leader>q', group = 'Session' },
        { '<leader>R', group = 'HTTP', icon = '' },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { '<C-/>', function() require('which-key').show({ global = false }) end, mode = 'i', desc = 'Buffer Local Keymaps (which-key)' },
    { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Keymaps (which-key)' },
    { '<c-w><space>', function() require('which-key').show({ keys = '<c-w>', loop = true }) end, desc = 'Window Hydra Mode (which-key)' },
  },
}
