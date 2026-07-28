vim.pack.add({
    'https://github.com/romus204/tree-sitter-manager.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
        version = 'main',
    },
})

require('tree-sitter-manager').setup({
    -- Default Options
    -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
    -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
    -- auto_install = false, -- if enabled, install missing parsers when editing a new file
    -- highlight = true, -- treesitter highlighting is enabled by default
    -- languages = {}, -- override or add new parser sources
    -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
    -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
})
vim.treesitter.language.register('tsx', 'javascriptreact')

require('treesitter-context').setup({
    multiwindow = true,
    max_lines = '10%',
})

require('nvim-treesitter-textobjects').setup({
    lookahead = true,
})
