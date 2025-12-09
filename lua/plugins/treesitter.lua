return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
  },
}
