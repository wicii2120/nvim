---@module 'codecompanion'
return {
    'olimorris/codecompanion.nvim',
    lazy = false,
    enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        interactions = {
            chat = {
                adapter = {
                    name = 'openrouter',
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
                    name = 'openrouter',
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
        adapters = {
            acp = {
                codex = function()
                    return require('codecompanion.adapters').extend('codex', {
                        defaults = {
                            auth_method = 'chatgpt', -- "openai-api-key"|"codex-api-key"|"chatgpt"
                        },
                    })
                end,
            },
            http = {
                openrouter = function()
                    return require('codecompanion.adapters').extend('openai', {
                        name = 'openrouter',
                        formatted_name = 'OpenRouter',
                        url = 'https://openrouter.ai/api/v1/chat/completions',
                        env = {
                            api_key = 'OPENROUTER_API_KEY',
                        },
                        headers = {
                            ['Content-Type'] = 'application/json',
                            Authorization = 'Bearer ${api_key}',
                            ['HTTP-Referer'] = 'https://github.com/olimorris/codecompanion.nvim',
                            ['X-Title'] = 'CodeCompanion',
                        },
                        schema = {
                            model = {
                                default = '@preset/deepseek-v4-flash',
                            },
                        },
                    })
                end,
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
