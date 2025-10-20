---@module 'edgy'
return {
  'folke/edgy.nvim',
  opts = function(_, opts)
    opts.animate = {
      enabled = false,
    }

    ---@type Edgy.Edgebar
    local bottom = opts.bottom
    for i, v in ipairs(bottom) do
      if type(v) == 'table' and v.ft == 'help' then
        table.remove(bottom, i)
      end
    end
  end,
}
