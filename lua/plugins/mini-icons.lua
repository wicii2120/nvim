return {
  'nvim-mini/mini.icons',
  version = false,
  opts = function()
    local prettier = { '.prettierrc', '.prettierrc.json', '.prettierrc.yaml', '.prettierrc.yml' }
    local tsconfig = { 'tsconfig.json', 'tsconfig.app.json', 'tsconfig.node.json' }

    local file = {
      ['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['vite.config.ts'] = { glyph = '', hl = 'MiniIconsPurple' },
      ['nuxt.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['favicon.ico'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
      ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['vitest.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['tsdown.config.ts'] = { glyph = '', hl = 'MiniIconsYellow' },
      ['drizzle.config.ts'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['.oxlintrc.json'] = { glyph = '', hl = 'MiniIconsOrange' },
      ['README.md'] = { glyph = '', hl = 'MiniIconsGray' },
    }

    for _, name in ipairs(prettier) do
      file[name] = { glyph = '', hl = 'MiniIconsPurple' }
    end

    for _, name in ipairs(tsconfig) do
      file[name] = { glyph = '', hl = 'MiniIconsBlue' }
    end

    return {
      file = file,
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
        vue = { glyph = '' },
      },
    }
  end,
  init = function()
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
}
