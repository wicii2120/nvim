---@type LazySpec
return {
  'nvim-mini/mini.animate',
  opts = function()
    local animate = require('mini.animate')

    local ret = {
      cursor = {
        timing = animate.gen_timing.exponential({
          easing = 'out',
          duration = 100,
          unit = 'total',
        }),
      },

      scroll = {
        timing = animate.gen_timing.quadratic({
          easing = 'in-out',
          duration = 200,
          unit = 'total',
        }),
      },

      resize = {
        enable = false,
      },
    }

    return ret
  end,
}
