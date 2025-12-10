---@class config: vim.lsp.ClientConfig
return {
  settings = {
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
