return {
    {
        'L3MON4D3/LuaSnip',
        config = function(_, opts)
            local ls = require('luasnip')
            ls.setup(opts)
            ls.filetype_extend('typescript', { 'javascript' })
            ls.filetype_extend('javascriptreact', { 'javascript' })
            ls.filetype_extend('typescriptreact', { 'javascript', 'javascriptreact' })
            ls.filetype_extend(
                'vue',
                { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
            )
            require('luasnip.loaders.from_lua').lazy_load({
                paths = { vim.fn.stdpath('config') .. '/snippets' },
            })
        end,
        keys = {
            {
                '<esc>',
                function()
                    local ls = require('luasnip')
                    if ls.get_active_snip() then
                        ls.unlink_current()
                    end
                    return '<esc>'
                end,
                mode = { 'i', 's', 'n' },
                expr = true,
            },
        },
    },
}
