---@module 'noice'
return {
  'folke/noice.nvim',
  opts = {
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        ---@type NoiceViewOptions
        opts = {
          position = { row = 2, col = 0 },
        },
      },
    },
  },
}
