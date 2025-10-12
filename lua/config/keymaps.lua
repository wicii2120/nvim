-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

do -- Terminal sider, for coding agents
  map("n", "<leader>tc", function()
    Snacks.terminal("codex", {
      cwd = LazyVim.root(),
      interactive = true,
      win = {
        width = 0.3,
        position = "right",
      },
    })
  end, { desc = "Open Codex" })

  map({ "n", "i", "t", "v" }, "<D-r>", function()
    local terminals = Snacks.terminal.list()
    local hasRight = false

    for i = #terminals, 1, -1 do
      local term = terminals[i]
      if term.opts.position == "right" then
        term:toggle()
        hasRight = true
        break
      end
    end

    if not hasRight then
      Snacks.terminal(nil, {
        cwd = LazyVim.root(),
        interactive = true,
        win = {
          width = 0.3,
          position = "right",
        },
      })
    end
  end)
end
