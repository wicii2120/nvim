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
      term_colors = true,
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
          ['@lsp.type.component.vue'] = { fg = colors.sapphire },
          ['@tag.tsx'] = { fg = colors.sapphire },
          WinSeparator = { fg = colors.overlay0 },
          SnacksIndentScope = { fg = colors.lavender },
        }
      end,
    },
  },
}
