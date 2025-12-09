return {
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
  config = function(_, opts)
    local spinner = require('plugins.code-companion.spinner')
    spinner:init()
    require('codecompanion').setup(opts)
  end,
}
