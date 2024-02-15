local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local defaults = {
  theme = 'default',
  layout_config = {
    prompt_position = 'top',
  },
  winblend = 5,
  sorting_strategy = 'ascending',
}

vim.keymap.set('n', '<leader>p', function()
  builtin.git_files(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
    show_untracked = true,
  }))
end)

vim.keymap.set('n', '<leader>P', function()
  builtin.find_files(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

vim.keymap.set('n', '<leader>f', function()
  builtin.current_buffer_fuzzy_find(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

vim.keymap.set('n', '<leader>F', function()
  builtin.live_grep(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

vim.keymap.set('n', '<leader>r', function()
  builtin.lsp_document_symbols(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

vim.keymap.set('n', 'gr', function()
  builtin.lsp_references(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

vim.keymap.set('n', '<leader>R', function()
  builtin.lsp_dynamic_workspace_symbols(vim.tbl_deep_extend('force', defaults, {
    -- Overrides
  }))
end)

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
})

