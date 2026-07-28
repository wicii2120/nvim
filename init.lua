require('vim._core.ui2').enable({ enable = true })

vim.filetype.add({
    filename = {
        ['compose.yaml']        = 'yaml.docker-compose',
        ['compose.yml']         = 'yaml.docker-compose',
        ['docker-compose.yaml'] = 'yaml.docker-compose',
        ['docker-compose.yml']  = 'yaml.docker-compose',
        ['.gitlab-ci.yml']      = 'yaml.gitlab',
    }
})

require('config.options')
require('config.autocmds')
require('config.keymaps')

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.cmd.colorscheme('catppuccin-mocha')
    end
})
