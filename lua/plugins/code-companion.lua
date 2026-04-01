---@module 'codecompanion'
local function is_gpt_54_model(model)
    return model == 'gpt-5.4' or model == 'gpt-5.4-mini'
end

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
            http = {
                copilot = function()
                    return require('codecompanion.adapters').extend('copilot', {
                        schema = {
                            top_p = {
                                enabled = function(self)
                                    local model = self.schema.model.default
                                    if type(model) == 'function' then
                                        model = model()
                                    end

                                    if is_gpt_54_model(model) then
                                        return false
                                    end

                                    return not vim.startswith(model, 'o1')
                                end,
                            },
                        },
                    })
                end,
            },
            acp = {
                codex = function()
                    return require('codecompanion.adapters').extend('codex', {
                        defaults = {
                            auth_method = 'chatgpt', -- "openai-api-key"|"codex-api-key"|"chatgpt"
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
