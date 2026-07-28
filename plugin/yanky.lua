vim.pack.add({ 'https://github.com/gbprod/yanky.nvim' })

require('yanky').setup({
    ring = { storage = 'shada' },
    highlight = { timer = 150 },
})

-- stylua: ignore start
vim.keymap.set({ 'n', 'x' }, '<leader>p', function() Snacks.picker.yanky() end, { desc = 'Open Yank History' })
vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)', { desc = 'Yank text' })
vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'Put yanked text after cursor' })
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'Put yanked text before cursor' })
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'Put yanked text after selection' })
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'Put yanked text before selection' })
vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)', { desc = 'Select previous entry through yank history' })
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)', { desc = 'Select next entry through yank history' })
-- stylua: ignore end
