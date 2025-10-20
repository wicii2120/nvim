---@module 'codecompanion'
---@module 'lazyvim'
return {
  {
    'olimorris/codecompanion.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ravitemer/mcphub.nvim',
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
          chat = {
            opts = {
              ---Decorate the user message before it's sent to the LLM
              ---@param message string
              ---@param adapter CodeCompanion.AdapterArgs
              ---@param context table
              ---@return string
              prompt_decorator = function(message, adapter, context)
                return string.format([[<prompt>%s</prompt>]], message)
              end,
            },
            keymaps = {
              send = {
                callback = function(chat)
                  vim.cmd('stopinsert')
                  chat:submit()
                  chat:add_buf_message({ role = 'llm', content = '' })
                end,
              },
              codeblock = {
                modes = { n = 'gi' },
              },
            },
            tools = {
              opts = {
                default_tools = {
                  'full_stack_dev',
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
        extensions = {
          mcphub = {
            callback = 'mcphub.extensions.codecompanion',
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },
      }
    end,
    ---@type LazyKeysSpec[]
    keys = {
      {
        '<leader>aa',
        '<cmd>CodeCompanionActions<cr>',
        desc = 'Code Companion Actions',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ac',
        '<cmd>CodeCompanionChat Toggle<cr>',
        desc = 'Code Companion Chat',
        mode = { 'n', 'v' },
      },
      {
        'ga',
        '<cmd>CodeCompanionChat Add<cr>',
        desc = 'Add to chat',
        mode = { 'v' },
      },
    },
    config = function(_p, opts)
      local spinner = require('plugins.code-companion.spinner')
      spinner:init()

      require('codecompanion').setup(opts)
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },

  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    build = 'pnpm install -g mcp-hub@latest',
    opts = {
      config = '/Users/vicii/Library/Application Support/Code/User/mcp.json',
      port = 37373,
    },
  },

  {
    'HakonHarnes/img-clip.nvim',
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = '[Image]($FILE_PATH)',
          use_absolute_path = true,
        },
      },
    },
  },
}
