-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

do -- habbits
  vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<d-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
  vim.keymap.set('i', '<d-cr>', '<c-o>o')
  vim.keymap.set('i', '<s-cr>', '<c-o>O', { noremap = true, silent = true })
  vim.keymap.set('c', '<c-a>', '<home>')
  vim.keymap.set('c', '<c-e>', '<end>')
  vim.keymap.set('n', 'q:', '<nop>', { noremap = true })
end
