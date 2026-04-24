---@module 'codecompanion'
return {
    'olimorris/codecompanion.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        interactions = {
            chat = {
                adapter = {
                    name = 'copilot',
                    model = 'gpt-5.4-mini',
                },
                keymaps = {
                    send = {
                        callback = function(chat)
                            vim.cmd('stopinsert')
                            chat:submit()
                            chat:add_buf_message({ role = 'llm', content = '' })
                        end,
                    },
                    close = false,
                },
                variables = {
                    buffer = {
                        opts = {
                            default_params = 'diff',
                        },
                    },
                },
                tools = {
                    ['grep_search'] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                    ['read_file'] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                },
            },
            inline = {
                adapter = {
                    name = 'copilot',
                    model = 'gpt-5.4-mini',
                },
                tools = {
                    ['read_file'] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                    ['grep_search'] = {
                        opts = {
                            require_approval_before = false,
                        },
                    },
                },
            },
        },
        display = {
            chat = {
                window = {
                    width = 0.3,
                    opts = {
                        conceallevel = 3,
                        number = false,
                        relativenumber = false,
                        signcolumn = 'no',
                    },
                },
            },
        },
    },
    specs = {
        {
            'MeanderingProgrammer/render-markdown.nvim',
            ft = { 'markdown', 'codecompanion' },
        },
    },
    keys = {
        {
            '<c-_>',
            '<cmd>CodeCompanionChat Toggle<cr>',
            desc = 'Toggle Code Companion Chat',
        },
        {
            '<c-/>',
            '<cmd>CodeCompanionChat Toggle<cr>',
            desc = 'Toggle Code Companion Chat',
        },
    },
}
