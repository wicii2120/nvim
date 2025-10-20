return {
  'catppuccin/nvim',
  lazy = true,
  name = 'catppuccin',
  opts = {
    background = {
      light = 'latte',
      dark = 'mocha',
    },
    float = {
      rounded = true,
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
    highlight_overrides = {
      all = function(colors)
        return {
          ['@lsp.type.component.vue'] = { fg = colors.pink },
          ['@tag.tsx'] = { fg = colors.pink },
        }
      end,
    },
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
    },
  },
  specs = {
    {
      'akinsho/bufferline.nvim',
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ''):find('catppuccin') then
          opts.highlights = require('catppuccin.special.bufferline').get_theme()
        end
      end,
    },
  },
}
