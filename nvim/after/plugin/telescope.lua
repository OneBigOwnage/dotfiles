local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>p', builtin.git_files, {})
vim.keymap.set('n', '<leader>P', builtin.find_files, {})
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>R', builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find)

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    git_files = { theme = 'dropdown', show_untracked = true },
    find_files = { theme = 'dropdown' },
    live_grep = { theme = 'dropdown' },
    lsp_document_symbols = { theme = 'dropdown' },
    lsp_dynamic_workspace_symbols = { theme = 'dropdown' },
    colorscheme = {
      enable_preview = true
    }
  },
})


