return {
  {
    'folke/snacks.nvim',
    ---@type snacks.config
    opts = {
      picker = {
        ---@type snacks.picker.previewers.Config
        previewers = {
          diff = {
            builtin = false,
            cmd = { 'delta' },
          },
          git = {
            builtin = false,
          },
        },
      },
      animate = {
        easing = 'inOutQuart',
        duration = {
          total = 200,
        },
      },
      explorer = {
        replace_netrw = false,
        trash = true,
      },
    },
    ---@type LazyKeysSpec[]
    keys = {
      {
        '<C-/>',
        function()
          Snacks.terminal([[zsh -l]], {
            cwd = LazyVim.root(),
            win = {
              position = 'float',
              border = 'rounded',
            },
          })
        end,
        desc = 'Terminal (Root)',
        mode = { 'n', 't' },
      },
    },
  },

  {
    'folke/trouble.nvim',
    optional = true,
    specs = {
      'folke/snacks.nvim',
      opts = function(_, opts)
        return vim.tbl_deep_extend('force', opts or {}, {
          picker = {
            actions = require('trouble.sources.snacks').actions,
            win = {
              input = {
                keys = {
                  ['<c-t>'] = {
                    'trouble_open',
                    mode = { 'n', 'i' },
                  },
                },
              },
            },
          },
        })
      end,
    },
  },
}
