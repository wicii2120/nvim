vim.pack.add({
    'https://github.com/saghen/blink.compat',
    'https://github.com/saghen/blink.lib',
    'https://github.com/bydlw98/blink-cmp-env',
    'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    completion = {
        -- use mini.icons for menu icons
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ =
                                require('mini.icons').get('lsp', ctx.kind)
                            return kind_icon
                        end,
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ =
                                require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    },
                    kind = {
                        -- (optional) use highlights from mini.icons
                        highlight = function(ctx)
                            local _, hl, _ =
                                require('mini.icons').get('lsp', ctx.kind)
                            return hl
                        end,
                    },
                },
            },
        },
        trigger = {
            show_on_keyword = true,
        },
        accept = {
            auto_brackets = {
                enabled = false,
            },
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
    },
    signature = {
        enabled = true,
    },
    snippets = {
        preset = 'luasnip',
    },
    sources = {
        default = { 'lsp', 'snippets', 'buffer', 'env', 'path' },

        per_filetype = {
            sql = { 'dadbod', 'snippets', 'buffer' },
            lua = { inherit_defaults = true, 'lazydev' },
        },

        providers = {
            lsp = {
                fallbacks = {},
                async = false,
                timeout_ms = 2000,
            },

            env = {
                name = 'Env',
                module = 'blink-cmp-env',
                --- @type blink-cmp-env.Options
                opts = {
                    item_kind = require('blink.cmp.types').CompletionItemKind.Variable,
                    show_braces = false,
                    show_documentation_window = true,
                },
            },
            dadbod = {
                name = 'Dadbod',
                module = 'vim_dadbod_completion.blink',
            },
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
        },
    },
})

vim.lsp.config('*', {
    capabilities = cmp.get_lsp_capabilities(),
})
