local get_recording_state = function()
  local reg = vim.fn.reg_recording()
  if reg ~= '' then
    return 'recording @' .. reg
  end
  return nil
end

local tab_name_group = vim.api.nvim_create_augroup('lualine_tab_name_persistence', { clear = true })

local get_tab_name_state_path = function()
  local ok, persistence = pcall(require, 'persistence')
  if not ok then
    return nil
  end

  local session_path = persistence.current()
  if session_path == nil or session_path == '' then
    return nil
  end

  return session_path:gsub('%.vim$', '.tabs.json')
end

local save_tab_names = function()
  local path = get_tab_name_state_path()
  if path == nil then
    return
  end

  local tab_names = {}
  for index, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    local ok, name = pcall(vim.api.nvim_tabpage_get_var, tabpage, 'tabname')
    tab_names[index] = ok and name or vim.NIL
  end

  vim.fn.writefile({ vim.json.encode(tab_names) }, path)
end

local restore_tab_names = function()
  local path = get_tab_name_state_path()
  if path == nil or vim.fn.filereadable(path) == 0 then
    return
  end

  local ok, tab_names = pcall(vim.json.decode, table.concat(vim.fn.readfile(path), '\n'))
  if not ok or type(tab_names) ~= 'table' then
    return
  end

  local tabpages = vim.api.nvim_list_tabpages()
  for index, name in ipairs(tab_names) do
    local tabpage = tabpages[index]
    if tabpage ~= nil then
      if name == vim.NIL or name == '' then
        pcall(vim.api.nvim_tabpage_del_var, tabpage, 'tabname')
      else
        vim.api.nvim_tabpage_set_var(tabpage, 'tabname', name)
      end
    end
  end

  vim.cmd('redrawtabline')
end

return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'folke/noice.nvim', 'folke/sidekick.nvim' },
    opts = function()
      vim.api.nvim_create_autocmd('User', {
        group = tab_name_group,
        pattern = 'PersistenceSavePre',
        callback = save_tab_names,
      })

      vim.api.nvim_create_autocmd('User', {
        group = tab_name_group,
        pattern = 'PersistenceLoadPost',
        callback = restore_tab_names,
      })

      -- local noice = require('noice')
      local sidekick = require('sidekick.status')
      local codecompanion = require('plugins.code-companion.lualine-component')

      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = false,
          globalstatus = true,
          refresh = {
            statusline = 150,
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
            { 'branch', separator = '|' },
            {
              'filename',
              newfile_status = true,
              path = 4,
            },
            'diagnostics',
          },
          lualine_c = {
            -- Copilot LSP
            {
              function()
                local status = sidekick.get()
                if not status then
                  return nil
                end
                if status.kind == 'Error' then
                  return ''
                end
                if status.kind == 'Warning' then
                  return ''
                end
                if status.kind == 'Normal' or status.kind == 'Inactive' then
                  return ''
                end
              end,
              color = function()
                local status = sidekick.get()
                if not status then
                  return nil
                end
                if status.kind == 'Error' then
                  return 'DiagnosticError'
                end
                if status.kind == 'Warning' then
                  return 'DiagnosticWarn'
                end
                if status.busy then
                  return 'DiagnosticWarn'
                end
                return 'Special'
              end,
              cond = function()
                return sidekick.get() ~= nil
              end,
            },
            -- CLI Session
            {
              function()
                local status = sidekick.cli()
                return '󱙺 ' .. (#status > 1 and #status or '')
              end,
              cond = function()
                return #sidekick.cli() > 0
              end,
              color = function()
                return 'Special'
              end,
            },
            codecompanion,
          },
          lualine_x = {
            {
              get_recording_state,
              cond = function()
                return get_recording_state() ~= nil
              end,
            },
            -- { noice.api.status.search.get, cond = noice.api.status.search.has },
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
