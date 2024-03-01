vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", ':Telescope git_branches<CR>')

function GitSync()
  local fetch_result = vim.fn.system("git fetch --all")

  if vim.v.shell_error ~= 0 then
    print("Fetch failed:\n" .. fetch_result)

    return
  end

  local pull_result = vim.fn.system("git pull")

  if vim.v.shell_error ~= 0 then
    print("Pull failed:\n" .. pull_result)

    return
  end

  local current_branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
  local push_result = vim.fn.system("git push --set-upstream origin " .. current_branch)
  if vim.v.shell_error ~= 0 then
    print("Push failed:\n" .. push_result)

    return
  end

  print("Sync successful")
end

function SetupFugitiveKeybindings()
  if vim.bo.filetype == 'fugitive' then
    vim.api.nvim_buf_set_keymap(0, 'n', 'gpl', ':Git pull<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'gps', ':Git push --quiet<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'cc', ':Git commit --quiet<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'ca', ':Git commit --amend --quiet<CR>', { noremap = true, silent = true })

    vim.api.nvim_buf_set_keymap(0, 'n', 'gs', ':lua GitSync()<CR>', { noremap = true, silent = true })
  end
end

vim.cmd [[
augroup FugitiveKeybindings
    autocmd!
    autocmd BufEnter * lua SetupFugitiveKeybindings()
augroup END
]]
