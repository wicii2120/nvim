vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

require('which-key').setup({
    preset = 'helix',
    spec = {
        {
            mode = { 'n', 'v' },
            { '<leader>a', group = 'AI', icon = '󱚠' },
        },
        {
            mode = { 'n' },
            { '<leader>g', group = 'Git' },
            { '<leader>c', group = 'Code' },
            { '<leader>q', group = 'Session' },
            { '<leader>R', group = 'HTTP', icon = '' },
        },
    },
})

vim.keymap.set('i', '<C-_>', function()
    require('which-key').show({ global = false })
end, { desc = 'Buffer Local Keymaps (which-key)' })
vim.keymap.set('i', '<C-/>', function()
    require('which-key').show({ global = false })
end, { desc = 'Buffer Local Keymaps (which-key)' })
vim.keymap.set('n', '<leader>?', function()
    require('which-key').show({ global = false })
end, { desc = 'Buffer Keymaps (which-key)' })
vim.keymap.set('n', '<c-w><space>', function()
    require('which-key').show({ keys = '<c-w>', loop = true })
end, { desc = 'Window Hydra Mode (which-key)' })
