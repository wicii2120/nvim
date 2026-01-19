---@module 'codecompanion'
return {
  'olimorris/codecompanion.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = 'copilot',
          model = 'claude-haiku-4.5',
        },
        tools = {
          opts = {
            default_tools = {
              'full_stack_dev'
            }
          }
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
        variables = {
          buffer = {
            opts = {
              default_params = 'diff',
            },
          },
        },
      },
      inline = {
        adapter = {
          name = 'copilot',
          model = 'gemini-3-flash-preview',
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
          width = 0.3,
          opts = {
            conceallevel = 3,
          },
        },
      },
      diff = {
        provider = 'mini_diff',
      },
    },
    adapters = {
      acp = {
        codex = function()
          return require('codecompanion.adapters').extend('codex', {
            defaults = {
              auth_method = 'chatgpt', -- "openai-api-key"|"codex-api-key"|"chatgpt"
            },
          })
        end,
      },
    },
  },
  specs = {
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
  },
  keys = {
    {
      '<c-/>',
      '<cmd>CodeCompanionChat Toggle<cr>',
      desc = 'Toggle Code Companion Chat (float)',
    },
  },
}
