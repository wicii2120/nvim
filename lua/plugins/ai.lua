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

    'saghen/blink.cmp',
    optional = true,
    dependencies = {
      'fang2hou/blink-copilot',
      opts = {
        max_completions = 1, -- Global default for max completions
        max_attempts = 2, -- Global default for max attempts
      },
    },
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- LazyVim Extra disabled it for copilot.lua
        copilot = { enabled = true },
      },
    },
  },

  {
    'mason-org/mason.nvim',
    opts = { ensure_installed = { 'copilot-language-server' } },
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
  },
}
