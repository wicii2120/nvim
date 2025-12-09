return {
  'folke/sidekick.nvim',
  opts = {
    nes = { enabled = false },
    cli = {
      mux = {
        backend = 'tmux',
        enabled = false,
      },
      win = {
        keys = {
          prompt = { '<s-c-p>', 'prompt', mode = 't', desc = 'insert prompt or context' },
        },
      },
    },
  },
}
