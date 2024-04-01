local autosave = require('auto-save')

autosave.setup({
  execution_message = {
    message = "",
  },
  condition = function(buffer)
    local utils = require("auto-save.utils.data")

    -- Don't attempt to auto-save the Harpoon UI and Noice rename UI.
    if vim.fn.getbufvar(buffer, "&modifiable") == 1
        and utils.not_in(vim.fn.getbufvar(buffer, "&filetype"), { "noice", "harpoon" })
    then
      return true
    end

    return false
  end
})
