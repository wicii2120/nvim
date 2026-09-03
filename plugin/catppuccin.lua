vim.pack.add({
    {
        src = 'https://github.com/catppuccin/nvim',
        name = 'catppuccin',
    },
})

require('catppuccin').setup({
    flavour = 'auto',
    dim_inactive = {
        enabled = true,
    },
    term_colors = true,
    background = {
        light = 'latte',
        dark = 'mocha',
    },
    lsp_styles = {
        underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
        },
    },
    auto_integrations = true,
    custom_highlights = function(colors)
        return {
            ['@lsp.type.component.vue'] = { fg = colors.sapphire },
            ['@tag.tsx'] = { fg = colors.sapphire },
            WinSeparator = { fg = colors.overlay0 },
            SnacksIndentScope = { fg = colors.lavender },
        }
    end,
})

-- Load immediately (not at VimEnter) so plugins like lualine resolve their theme
-- against an already-loaded flavour, and OS theme changes propagate from startup.
vim.cmd.colorscheme('catppuccin-nvim')

