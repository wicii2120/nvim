return {
  {
    'L3MON4D3/LuaSnip',
    config = function(_, opts)
      local ls = require('luasnip')
      ls.setup(opts)
      require('luasnip.loaders.from_lua').lazy_load({
        paths = { vim.fn.stdpath('config') .. '/snippets' },
      })
      ls.filetype_extend('typescript', { 'javascript' })
      ls.filetype_extend('javascriptreact', { 'javascript' })
      ls.filetype_extend('typescriptreact', { 'javascript', 'javascriptreact' })
    end,
  },
}
