---@module 'edgy'
return {
  'folke/edgy.nvim',
  opts = function(_, opts)
    opts.animate = {
      enabled = false,
    }

    for _, pos in ipairs({ 'top', 'right', 'bottom', 'left' }) do
      local edgyPos = opts[pos]
      for i, win in ipairs(edgyPos) do
        if type(win) == 'table' and win.ft == 'help' then
          table.remove(edgyPos, i)
        end
      end
    end
  end,
}
