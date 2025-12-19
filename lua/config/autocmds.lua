---@param name string
local augroup = function(name)
  return vim.api.nvim_create_augroup('my.' .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
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
    group = augroup('treesitter'),
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

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = augroup('scratch buffer'),
  callback = function()
    local bt = vim.bo.buftype
    if bt == 'nofile' or bt == 'help' then
      vim.keymap.set('n', 'q', '<cmd>bdelete<cr>', { buffer = true })
    end
  end,
})
