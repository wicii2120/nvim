vim.keymap.set('i', '<s-cr>', '<c-o>O')
vim.keymap.set('i', '<d-cr>', '<c-o>o')

vim.keymap.set('v', '<d-c>', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<d-c>', '"+yy', { desc = 'Copy line to system clipboard' })

-- Quit
vim.cmd.cabbrev('Qa', 'qa')
vim.cmd.cabbrev('QA', 'qa')
vim.cmd.cabbrev('Q', 'q')

vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<d-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'lazy.nvim' })

-- Move Lines
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set(
  'v',
  '<A-j>',
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  { desc = 'Move Down' }
)
vim.keymap.set(
  'v',
  '<A-k>',
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  { desc = 'Move Up' }
)

-- Add undo break-points
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

-- better indenting
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- commenting
vim.keymap.set(
  'n',
  'gco',
  'o<esc>ccx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add Comment Below' }
)
vim.keymap.set(
  'n',
  'gcO',
  'O<esc>ccx<esc><cmd>normal gcc<cr>fxa<bs>',
  { desc = 'Add Comment Above' }
)
