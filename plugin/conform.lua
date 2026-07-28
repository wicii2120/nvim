vim.pack.add({
    'https://github.com/stevearc/conform.nvim',
})

local oxfmt_ft = {
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
    'css',
    'html',
    'vue',
    'json',
    'jsonc',
    'json5',
    'yaml',
    'toml',
}
local formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff' },
    go = { 'gofmt' },
    sh = { 'shfmt' },
}

for _, ft in ipairs(oxfmt_ft) do
    formatters_by_ft[ft] = { 'oxfmt' }
end

require('conform').setup({
    formatters_by_ft = formatters_by_ft,
})

vim.keymap.set({ 'n', 'x' }, '<leader>cF', function()
    require('conform').format({ formatters = { 'injected' } })
end, { desc = 'Format Injected Langs' })
vim.keymap.set({ 'n', 'x' }, '<leader>cf', function()
    require('conform').format()
end, { desc = 'Format Buffer' })
