_G.my_status_line = function()
  return table.concat({
    ' %f',
    ' %h%q%w',
    ' %r%m',
    '%=',
    '%S',
    '%=',
    ' %y',
    ' %l,%v  %p%% ',
  })
end
