vim.pack.add({ 'https://github.com/nvim-mini/mini.surround' })

require('mini.surround').setup({
    n_lines = 100,
    mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
    },
    search_method = 'cover_or_next',
})
