require('vim._core.ui2').enable({ enable = true })

require('config.options')
require('config.lazy')
require('config.autocmds')
require('config.keymaps')
require('config.filetype')

vim.cmd.colorscheme('catppuccin-mocha')
