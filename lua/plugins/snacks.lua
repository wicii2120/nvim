return {
  "folke/snacks.nvim",
  ---@type snacks.config
  opts = {
    animate = {
      duration = 10,
    },
    picker = {
      previewers = {
        diff = {
          builtin = false,
          cmd = { "diff-so-fancy" },
        },
      },
    },
  },
}
