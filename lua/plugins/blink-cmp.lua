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
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
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
  },
}
