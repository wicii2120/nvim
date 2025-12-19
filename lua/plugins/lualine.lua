return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'folke/noice.nvim' },
    opts = function()
      local noice = require('noice')

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = false,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'filename',
              newfile_status = true,
              path = 4,
              symbols = {
                modified = '',
                readonly = '󰍁',
                unnamed = '',
                newfile = '',
              },
            },
            'diagnostics',
          },
          lualine_c = {
            {
              noice.api.status.command.get_hl,
              cond = noice.api.status.command.has,
            },
          },
          lualine_x = {
            { noice.api.status.mode.get, cond = noice.api.status.mode.has },
            { noice.api.status.search.get, cond = noice.api.status.search.has },
            'filetype',
            'fileformat',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              mode = 2,
              symbols = {
                modified = ' ',
              },
              use_mode_colors = true,
            },
          },
        },
        winbar = {},
        inactive_winbar = {},
        extensions = { 'quickfix', 'fugitive', 'mason', 'man', 'lazy' },
      }
    end,
  },
}
