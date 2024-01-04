local autosave = require('auto-save')

autosave.setup({
  execution_message = {
    message = ''
  },
  condition = function(buf)
    -- Only attempt to auto-save normal buffers
    -- This is a fix for auto-save trying to "Save" the Harpoon UI
    if vim.bo[buf].buftype ~= "" then
      return false
    end
  end
})
