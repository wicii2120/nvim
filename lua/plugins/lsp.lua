return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      vtsls = {
        settings = {
          typescript = {
            suggest = {
              autoImports = true,
            },
          },
          javascript = {
            suggest = {
              autoImports = true,
            },
          },
        },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { 'twMerge', 'cva', 'tv' },
            classAttributes = { 'class', 'className', 'ngClass', 'class:list', 'ui' },
          },
        },
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, vim.lsp.config.tailwindcss.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        -- Additional settings for Phoenix projects
        opts.settings = vim.tbl_deep_extend('keep', opts.settings, {
          tailwindCSS = {
            includeLanguages = {
              elixir = 'html-eex',
              eelixir = 'html-eex',
              heex = 'html-eex',
            },
          },
        })
        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,
    },
  },
}
