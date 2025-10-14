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
    },
  },
}
