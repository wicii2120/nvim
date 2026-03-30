require('vim._core.ui2').enable({ enable = true })

require('config.options')
require('config.lazy')
require('config.autocmds')
require('config.keymaps')

vim.cmd([[colorscheme catppuccin-mocha]])
