---@type LazySpec[]
return {
  {
    'folke/sidekick.nvim',
    opts = {
      nes = { enabled = false },
      cli = {
        mux = {
          backend = 'tmux',
          enabled = false,
        },
      },
    },
  },

  --#region copilot.lua
  {
    'zbirenbaum/copilot.lua',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
      },
    },
    keys = {
      {
        '<m-l>',
        function()
          return require('copilot.suggestion').accept()
        end,
        mode = 'i',
      },
    },
    cmd = 'Copilot',
    lazy = false,
  },

  {
    'mason-org/mason.nvim',
    opts = { ensure_installed = { 'copilot-language-server' } },
  },
  --#endregion

  {
    'olimorris/codecompanion.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = function()
      return {
        strategies = {
          chat = {
            adapter = {
              name = 'copilot',
              model = 'claude-opus-4.5',
            },
            tools = {
              opts = {
                default_tools = {
                  'full_stack_dev',
                },
              },
            },
          },
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
        display = {
          chat = {
            window = {
              width = 0.35,
            },
          },
        },
        keymaps = {
          send = {
            callback = function(chat)
              vim.cmd('stopinsert')
              chat:submit()
              chat:add_buf_message({ role = 'llm', content = '' })
            end,
          },
        },
      }
    end,
    keys = {
      {
        '<leader>ac',
        '<cmd>CodeCompanionChat Toggle<cr>',
        desc = 'Code Companion Chat',
        mode = { 'n', 'v' },
      },
    },
    config = function(_, opts)
      local spinner = require('plugins.code-companion.spinner')
      spinner:init()
      require('codecompanion').setup(opts)
    end,
  },
}
