-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

do -- habbits
  map({ 'n', 'i', 'x', 'v' }, '<D-s>', '<Cmd>w<CR><Esc>', { desc = 'Save file' })
end
