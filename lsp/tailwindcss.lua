---@class config: vim.lsp.ClientConfig
return {
  settings = {
    tailwindCSS = {
      classFunctions = { 'twMerge', 'cva', 'tv' },
      classAttributes = { 'class', 'className', 'ngClass', 'class:list', 'ui' },
    },
  },
}
