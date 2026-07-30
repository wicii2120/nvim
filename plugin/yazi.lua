vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/mikavilpas/yazi.nvim',
})

vim.g.loaded_netrwPlugin = 1

require('yazi').setup({
    open_for_directories = true,
    keymaps = {
        show_help = '<f2>',
    },
})

vim.keymap.set('n', '<leader>ee', function()
    vim.cmd.Yazi()
end, { desc = 'Open Yazi at the current file' })

vim.keymap.set('n', '<leader>ew', function()
    vim.cmd.Yazi('cwd')
end, { desc = 'Open Yazi in the current working directory' })

