---@type vim.lsp.Config
return {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = '',
            },
        },
    },
    before_init = function(_, client_config)
        client_config.settings.yaml.schemas =
            require('schemastore').yaml.schemas()
    end,
}
