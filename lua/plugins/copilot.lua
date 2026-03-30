return {
    'zbirenbaum/copilot.lua',
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = false,
        },
    },
    cmd = 'Copilot',
    event = { 'InsertEnter' },
}
