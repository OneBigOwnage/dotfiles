vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches<CR>')

function SetupFugitiveKeybindings()
  if vim.bo.filetype == 'fugitive' then
    vim.api.nvim_buf_set_keymap(0, 'n', 'gpl', ':G pull<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'gps', ':G push<CR>', { noremap = true, silent = true })
  end
end

vim.cmd [[
augroup FugitiveKeybindings
    autocmd!
    autocmd BufEnter * lua SetupFugitiveKeybindings()
augroup END
]]
