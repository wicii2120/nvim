-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.wrap = true
vim.o.winborder = 'rounded'
vim.o.spell = false
vim.o.colorcolumn = '80'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.lazyvim_python_lsp = 'basedpyright'
vim.g.lazyvim_prettier_needs_config = true
vim.g.root_spec = { { '.git', 'lua' }, 'cwd' }
vim.g.snacks_animate = false
