vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches<CR>')

function SetupFugitiveKeybindings()
  if vim.bo.filetype == 'fugitive' then
    vim.api.nvim_buf_set_keymap(0, 'n', 'gpl', ':Git pull<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'gps', ':Git push<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'cc', ':Git commit --quiet<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'ca', ':Git commit --amend --quiet<CR>', { noremap = true, silent = true })
  end
end

vim.cmd [[
augroup FugitiveKeybindings
    autocmd!
    autocmd BufEnter * lua SetupFugitiveKeybindings()
augroup END
]]
