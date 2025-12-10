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
        keymaps = {
          send = {
            callback = function(chat)
              vim.cmd('stopinsert')
              chat:submit()
              chat:add_buf_message({ role = 'llm', content = '' })
            end,
          },
          close = false,
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
          layout = 'float',
          height = 0.9,
          width = 0.9,
          opts = {
            conceallevel = 3,
          },
        },
      },
    },
  },
  specs = {
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
  },
  config = function(_, opts)
    local spinner = require('plugins.code-companion.spinner')
    spinner:init()
    require('codecompanion').setup(opts)
  end,
  keys = {
    {
      '<leader>ac',
      function()
        require('codecompanion').toggle()
      end,
      desc = 'Toggle Code Companion Chat (float)',
    },
  },
}
