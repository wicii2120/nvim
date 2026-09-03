vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.inlay_hint.enable(false)

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    },
    virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '',
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- prefix = "icons",
    },
    severity_sort = true,
})

local enabled_lsps = {
    'lua_ls',
    'bashls',
    'fish_lsp',
    'yamlls',
    'tombi',
    'ty',
    'tailwindcss',
    'cssls',
    'jsonls',
    'oxlint',
    'gopls',
    'vtsls',
    'vue_ls',
    'docker_language_server',
    'nginx_language_server',
    'texlab'
}

for _, lsp in ipairs(enabled_lsps) do
    vim.lsp.enable(lsp)
end
