-- vim.opt.viewoptions:remove("options")  -- optional: skip restoring options
local group = vim.api.nvim_create_augroup("remember_views", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = group,
  pattern = "*",
  callback = function() vim.cmd("silent! mkview") end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  pattern = "*",
  callback = function() vim.cmd("silent! loadview") end,
})
