vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })

local get_recording_state = function()
    local reg = vim.fn.reg_recording()
    if reg ~= '' then
        return 'recording @' .. reg
    end
    return nil
end

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'catppuccin-nvim',
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
    extensions = { 'quickfix', 'fugitive', 'man' },
})
