-- Refreshed by ~/.local/bin/sync-vue-language-server.
local vue_language_server_path =
    vim.fn.stdpath('data') .. '/pnpm/vue-language-server'

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

---@class config: vim.lsp.Config
return {
    filetypes = {
        'vue',
        'typescript',
        'javascript',
        'typescriptreact',
        'javascriptreact',
    },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
        typescript = {
            suggest = {
                autoImports = true,
                completeFunctionCalls = false,
            },
        },
        javascript = {
            suggest = {
                autoImports = true,
                completeFunctionCalls = false,
            },
        },
    },
}
