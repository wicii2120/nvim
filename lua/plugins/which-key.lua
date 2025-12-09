return {
  'folke/which-key.nvim',
  opts = {
    preset = 'helix',
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>a', group = 'AI', icon = '󰫮' },
      },
      {
        mode = { 'n', 'x' },
        { '<leader>g', group = 'Git' },
        { '<leader>n', group = 'Noice' },
        { '<leader>c', group = 'Code' },
        { '<leader>q', group = 'Session' },
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
