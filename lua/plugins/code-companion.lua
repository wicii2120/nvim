return {
  'olimorris/codecompanion.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    ignore_warnings = true,
    strategies = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'gemini-3-pro-preview',
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
  },
  config = function(_, opts)
    local spinner = require('plugins.code-companion.spinner')
    spinner:init()
    require('codecompanion').setup(opts)
  end,
  keys = {
    {
      '<c-.>',
      function()
        require('codecompanion').toggle({ window_opts = { layout = 'float', width = 0.7 } })
      end,
      desc = 'Toggle Code Companion Chat (float)',
    },
  },
}
