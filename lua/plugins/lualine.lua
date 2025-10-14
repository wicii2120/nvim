return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function(_, opts)
      local spinner = require('codecompanion_lualine_component')
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}

      local already_added = false
      for _, component in ipairs(opts.sections.lualine_x) do
        if type(component) == 'table' and component[1] == spinner then
          already_added = true
          break
        end
      end

      if not already_added then
        table.insert(opts.sections.lualine_x, 1, { spinner })
      end
    end,
  },
}
