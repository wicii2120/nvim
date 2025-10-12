return {
  "folke/which-key.nvim",
  keys = {
    {
      "<C-/>",
      mode = "i",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
