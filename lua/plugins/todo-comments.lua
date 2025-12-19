return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  specs = {
    {
      'snacks.nvim',
      keys = {
        {
          '<leader>sT',
          function()
            Snacks.picker.todo_comments()
          end,
          desc = 'Todo',
        },
      },
    },
  },
}
