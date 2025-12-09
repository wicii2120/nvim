-- go use actual tabs
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('programming_language', { clear = false }),
  pattern = { 'go' },
  callback = function()
    vim.bo.expandtab = false
  end,
})

-- 2 space tab
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('programming_language', { clear = false }),
  pattern = {
    'lua',
    'html',
    'xml',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
    'yaml',
    'css',
    'http',
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- treeistter
local ts = require('nvim-treesitter')
if ts then
  local installed = ts.get_installed()
  vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = vim.api.nvim_create_augroup('my_treesitter', { clear = true }),
    callback = function(ev)
      local ft = ev.match
      local lang = vim.treesitter.language.get_lang(ft)
      if not vim.tbl_contains(installed, lang) then
        return
      end

      vim.treesitter.start(ev.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo.foldmethod = 'expr'
    end,
  })
end
