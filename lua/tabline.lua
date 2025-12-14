_G.get_tab_label = function(n)
  local buflist = vim.fn.tabpagebuflist(n)
  local winnr = vim.fn.tabpagewinnr(n)
  local lastbuf = buflist[winnr]
  local bufname = vim.fn.bufname(lastbuf)
  if #bufname == 0 then
    local buftype = vim.bo[lastbuf].buftype
    if #buftype == 0 then
      return '[Empty]'
    end
    return buftype
  end
  local path = vim.fs.normalize(bufname)
  return vim.fn.fnamemodify(path, ':t')
end

_G.my_tab_line = function()
  local s = ''

  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    s = s .. '%' .. i .. 'T ' .. i .. ' %{v:lua.get_tab_label(' .. i .. ')}' .. '%#TabLineFill#%T |'
  end

  return s
end
