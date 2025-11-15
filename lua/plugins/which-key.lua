return {
    'folke/which-key.nvim',
    opts = {
        spec = {
            {
                mode = { 'n', 'v' },
                { '<leader>a', group = 'AI', icon = '󰫮' },
            },
        },
    },
    keys = {
        {
            '<C-/>',
            mode = 'i',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
}
