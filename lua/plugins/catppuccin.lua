return {
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    ---@module 'catppuccin'
    ---@type CatppuccinOptions
    opts = {
      flavour = 'mocha',
      dim_inactive = {
        enabled = true,
      },
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      lsp_styles = {
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      auto_integrations = true,
      custom_highlights = function(colors)
        return {
          ['@lsp.type.component.vue'] = { fg = colors.pink },
          ['@tag.tsx'] = { fg = colors.pink },
          WinSeparator = { fg = colors.lavender },
        }
      end,
    },
  },
}
