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
  --{
  --  'zbirenbaum/copilot.lua',
  --  opts = {
  --    suggestion = {
  --      enabled = true,
  --      auto_trigger = true,
  --    },
  --  },
  --  keys = {
  --    {
  --      '<a-l>',
  --      function()
  --        return require('copilot.suggestion').accept()
  --      end,
  --      expr = true,
  --      mode = 'i',
  --      desc = 'Accecpt Copilot Suggestion',
  --    },
  --    {
  --      '<a-]>',
  --      function()
  --        return require('copilot.suggestion').next()
  --      end,
  --      expr = true,
  --      mode = 'i',
  --      desc = 'Next Copilot Suggestion',
  --    },
  --    {
  --      '<a-[>',
  --      function()
  --        return require('copilot.suggestion').prev()
  --      end,
  --      expr = true,
  --      mode = 'i',
  --      desc = 'Previous Copilot Suggestion',
  --    },
  --    {
  --      '<c-]>',
  --      function()
  --        return require('copilot.suggestion').dismiss()
  --      end,
  --      expr = true,
  --      mode = 'i',
  --      desc = 'Dismiss Copilot Suggestion',
  --    },
  --  },
  --},
  --{
  --  'saghen/blink.cmp',
  --  optional = true,
  --  dependencies = {
  --    'fang2hou/blink-copilot',
  --    opts = {
  --      max_completions = 1, -- Global default for max completions
  --      max_attempts = 2, -- Global default for max attempts
  --    },
  --  },
  --  opts = {
  --    sources = {
  --      default = { 'copilot' },
  --      providers = {
  --        copilot = {
  --          name = 'copilot',
  --          module = 'blink-copilot',
  --          score_offset = 100,
  --          async = true,
  --        },
  --      },
  --    },
  --  },
  --},
  --
  --{
  --  'neovim/nvim-lspconfig',
  --  opts = {
  --    servers = {
  --      -- LazyVim Extra disabled it for copilot.lua
  --      copilot = { enabled = true },
  --    },
  --  },
  --},
  --
  --{
  --  'mason-org/mason.nvim',
  --  opts = { ensure_installed = { 'copilot-language-server' } },
  --},
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
              model = 'claude-haiku-4.5',
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
