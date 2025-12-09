return {
  'nvim-mini/mini.icons',
  version = false,
  opts = {
    file = {
      ['package.json'] = { glyph = '' },
      ['vite.config.ts'] = { glyph = '', hl = 'MiniIconsPurple' },
      ['nuxt.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['favicon.ico'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
      ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['vitest.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['tsdown.config.ts'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['drizzle.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
    },
    filetype = {
      dotenv = { glyph = '', hl = 'MiniIconsYellow' },
    },
  },
  init = function()
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
}
