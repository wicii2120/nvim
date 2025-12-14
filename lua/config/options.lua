vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.o.wrap = true
vim.o.spell = false
vim.o.winborder = 'rounded'
vim.o.colorcolumn = '80'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.shiftround = true -- Round indent

vim.o.exrc = true
vim.o.autowrite = true
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically.
vim.o.clipboard = vim.env.SSH_CONNECTION and '' or 'unnamedplus' -- Sync with system clipboard
vim.o.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.foldlevel = 20
vim.o.foldmethod = 'indent'
vim.o.ignorecase = true -- Ignore case
vim.o.inccommand = 'nosplit' -- preview incremental substitute
vim.o.jumpoptions = 'clean'
vim.o.laststatus = 3 -- global statusline
vim.o.linebreak = true -- Wrap lines at convenient points
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.number = true -- Print line number
vim.o.relativenumber = true -- Relative line numbers
vim.o.pumheight = 20 -- Maximum number of entries in a popup
vim.o.scrolloff = 4 -- Lines of context
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smoothscroll = true
vim.o.splitright = true
vim.o.splitkeep = 'screen'
vim.o.splitbelow = true -- Put new windows below current
vim.o.termguicolors = true -- True color support
vim.o.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
vim.o.undofile = true
vim.o.updatetime = 500
vim.o.wildmode = 'longest:full,full' -- Command-line completion mode
vim.o.winminwidth = 5 -- Minimum window width
vim.o.signcolumn = 'no'
vim.o.showcmdloc = 'statusline'

vim.opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  diff = '╱',
  eob = '~',
}
vim.opt.sessionoptions = {
  'buffers',
  'curdir',
  'tabpages',
  'winsize',
  'help',
  'globals',
  'skiprtp',
  'folds',
}
vim.opt.shortmess:append({ a = true })
vim.opt.rulerformat = '%=%l,%v  %p%% '
vim.opt.formatoptions:append({ r = true, n = true, ['1'] = true, p = true })

require('statusline')
vim.o.statusline = '%!v:lua.my_status_line()'
require('tabline')
vim.o.tabline = '%!v:lua.my_tab_line()'

vim.filetype.add({
  pattern = {
    ['.*%.env.*'] = 'dotenv',
  },
})
vim.treesitter.language.register('bash', 'dotenv')
