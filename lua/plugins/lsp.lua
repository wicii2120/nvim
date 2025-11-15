return {
  'neovim/nvim-lspconfig',
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      -- vue_ls = {
      --   filetypes = { 'vue', 'typescriptreact' },
      -- },
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
  },
}
