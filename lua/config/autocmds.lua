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
    pattern = '*',
    callback = function(ev)
      local ft = ev.match
      local lang = vim.treesitter.language.get_lang(ft)
      if not vim.tbl_contains(installed, lang) then
        return
      end

      vim.treesitter.start(ev.buf)
      vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

      local keep_indent_fdm = { 'checkhealth' }
      if not vim.tbl_contains(keep_indent_fdm, ft) then
        vim.opt_local.foldmethod = 'expr'
      end
    end,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup('tsc-make'),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local ts_cmd_map = {
      vue_ls = 'vue-tsc',
      vtsls = 'tsc',
      tsgo = 'tsgo',
    }

    local ts_cmd = ts_cmd_map[client.name]

    if not ts_cmd then
      return
    end

    local efm = [[%f\(%l\,%c\):\ error\ TS%n:\ %m]]
    local tsc_opts = ' --build --noEmit --pretty false '

    ---@param compiler 'vue-tsc' | 'tsc' | 'tsgo'
    local function defCommand(compiler)
      local cmd = require('textcase').api.to_pascal_case(compiler)
      vim.api.nvim_create_user_command(cmd, function()
        local cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
        local res = vim
          .system({ 'zsh', '-c', 'pnpm ' .. ts_cmd .. tsc_opts }, { cwd = cwd, text = true })
          :wait()
        local out = (res.stdout or '') .. '\n' .. (res.stderr or '')
        local lines = vim.split(out, '\n', { trimempty = true })
        vim.schedule(function()
          vim.fn.setqflist({}, ' ', {
            title = compiler .. ' diagnostics',
            lines = lines,
            efm = efm,
          })
          vim.cmd('copen | stopi')
        end)
      end, { bar = true })
    end

    defCommand(ts_cmd)
  end,
})
