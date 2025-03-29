return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    require('copilot').setup({
      panel = { enabled = false },
      suggestion = { enabled = false },
    })

    require('copilot_cmp').setup()
  end
}
