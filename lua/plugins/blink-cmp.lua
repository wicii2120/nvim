return {
  'saghen/blink.cmp',
  build = 'cargo build --release',
  opts_extend = {
    'sources.completion.enabled_providers',
    'sources.compat',
    'sources.default',
  },
  dependencies = {
    {
      'saghen/blink.compat',
      optional = true, -- make optional so it's only enabled if any extras need it
      opts = {},
    },
    { 'bydlw98/blink-cmp-env' },
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = function()
    return {
      completion = {
        -- use mini.icons for menu icons
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                  return kind_icon
                end,
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              },
              kind = {
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        trigger = {
          show_on_keyword = true,
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
      signature = {
        enabled = true,
      },
      snippets = {
        preset = 'luasnip',
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
        use_proximity = true,
        frecency = {
          enabled = true,
        },
      },
      sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path', 'env' },

        providers = {
          lsp = {
            fallbacks = {},
            async = false,
            timeout_ms = 2000,
          },

          env = {
            name = 'Env',
            module = 'blink-cmp-env',
            --- @type blink-cmp-env.Options
            opts = {
              item_kind = require('blink.cmp.types').CompletionItemKind.Variable,
              show_braces = false,
              show_documentation_window = true,
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local blink = require('blink.cmp')
    blink.setup(opts)

    vim.lsp.config('*', {
      capabilities = blink.get_lsp_capabilities(),
    })
  end,
}
