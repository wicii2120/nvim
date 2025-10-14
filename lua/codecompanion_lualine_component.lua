local Spinner = require("lualine.component"):extend()

local spinner_symbols = {
  "⠋",
  "⠙",
  "⠹",
  "⠸",
  "⠼",
  "⠴",
  "⠦",
  "⠧",
  "⠇",
  "⠏",
}

local spinner_symbols_len = #spinner_symbols

local function setup_autocmd(component)
  local group = vim.api.nvim_create_augroup("CodeCompanionLualineSpinner", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(event)
      if event.match == "CodeCompanionRequestStarted" then
        component.processing = true
      elseif event.match == "CodeCompanionRequestFinished" then
        component.processing = false
        component.spinner_index = 1
      end
    end,
  })
end

function Spinner:init(options)
  Spinner.super.init(self, options)
  self.processing = false
  self.spinner_index = 1
  setup_autocmd(self)
end

function Spinner:update_status()
  if not self.processing then
    return nil
  end

  self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
  return spinner_symbols[self.spinner_index]
end

return Spinner
