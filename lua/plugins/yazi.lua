---@module 'yazi'
return {
    'mikavilpas/yazi.nvim',
    version = '*', -- use the latest stable version
    event = 'VeryLazy',
    dependencies = {
        { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            '<leader>-',
            mode = { 'n', 'v' },
            '<cmd>Yazi<cr>',
            desc = 'Open yazi at the current file',
        },
        {
            -- Open in the current working directory
            '<leader>cw',
            '<cmd>Yazi cwd<cr>',
            desc = "Open the file manager in nvim's working directory",
        },
        {
            '<c-up>',
            '<cmd>Yazi toggle<cr>',
            desc = 'Resume the last yazi session',
        },
    },
    ---@type YaziConfig | {}
    opts = {
        floating_window_scaling_factor = 1,
        keymaps = {
            show_help = '<f1>',
        },
        integrations = {
            picker_add_copy_relative_path_action = 'snacks.picker',
            bufdelete_implementation = 'snacks-if-available',
            grep_in_directory = 'snacks.picker',
            grep_in_selected_files = 'snacks.picker',
        },
    },
}
