return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {},
    config = function()
      vim.filetype.add({
        pattern = {
          ['.*%.env.*'] = 'dotenv',
        },
      })
      vim.treesitter.language.register('bash', 'dotenv')
      vim.treesitter.language.register('tsx', 'javascriptreact')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      multiwindow = true,
      max_lines = '10%',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    opts = {
      lookahead = true,
    },
  },
}
