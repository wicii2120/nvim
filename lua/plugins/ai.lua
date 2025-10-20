return {
  {
    'folke/sidekick.nvim',
    opts = {
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
  },

  {
    'olimorris/codecompanion.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = function()
      return {
        strategies = {
          inline = {
            adapter = {
              name = 'copilot',
              model = 'claude-haiku-4.5',
            },
            tools = {
              opts = {
                default_tools = {
                  'files',
                },
              },
            },
          },
        },
        adapters = {
          copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
              schema = {
                model = {
                  default = 'claude-haiku-4.5',
                },
              },
            })
          end,
        },
      }
    end,
    config = function(_, opts)
      require('codecompanion').setup(opts)
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },
}
