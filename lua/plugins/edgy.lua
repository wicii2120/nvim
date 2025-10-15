return {
  'folke/edgy.nvim',
  opts = function(_, opts)
    ---@type Edgy.Pos
    local bottom = opts.bottom
    for i, v in ipairs(bottom) do
      if type(v) == 'table' and v.ft == 'help' then
        table.remove(bottom, i)
      end
    end
  end,
}
