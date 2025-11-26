---@module 'trouble'
return {
  'folke/trouble.nvim',
  ---@type trouble.Config
  opts = {
    auto_close = true,
    modes = {
      qflist = {
        auto_jump = true,
      },
      loclist = {
        auto_jump = true,
      },
    },
  },
}
