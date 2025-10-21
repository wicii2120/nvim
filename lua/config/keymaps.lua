-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

do -- habbits
  map({ 'n', 'i', 'x', 'v' }, '<d-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
  map('n', 'q:', '<nop>', { noremap = true })
  map('i', '<c-e>', '<c-o>g<end>')
  map('i', '<c-a>', '<c-o>g^')
  map('i', '<d-cr>', '<c-o>o')
  map('i', '<s-cr>', '<c-o>o')
  map('c', '<c-a>', '<home>')
  map('c', '<c-e>', '<end>')

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'grug-far',
    callback = function()
      map('n', 'q', '<Nop>', { buffer = true, noremap = true })
    end,
  })
end
