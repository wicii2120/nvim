-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

do -- habbits
  map({ 'n', 'i', 'x', 'v' }, '<D-s>', '<Cmd>w<CR><Esc>', { desc = 'Save file' })
end

do -- Terminal sider, for coding agents
  ---@type snacks.win.Config
  local win_option = {
    width = 0.3,
    position = 'right',
  }

  map('n', '<leader>tc', function()
    Snacks.terminal('codex', {
      interactive = true,
      win = win_option,
    })
  end, { desc = 'Open Codex' })

  map({ 'n', 'i', 't', 'v' }, '<D-r>', function()
    local terminals = Snacks.terminal.list()
    local hasRight = false

    for i = #terminals, 1, -1 do
      local term = terminals[i]
      if term.opts.position == 'right' then
        term:toggle()
        hasRight = true
        break
      end
    end

    if not hasRight then
      Snacks.terminal(nil, {
        interactive = true,
        win = win_option,
      })
    end
  end)
end
