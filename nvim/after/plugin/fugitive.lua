local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local createBranch = vim.schedule_wrap(function(branch)
  if branch == nil or branch == '' then
    print('Branch name cannot be empty')
    return
  end

  vim.cmd('Git checkout -b ' .. branch)

  local push_async = vim.schedule_wrap(function()
    vim.cmd('Git push --quiet --set-upstream origin ' .. branch)
  end)

  push_async()
end)

local function git_branches()
  builtin.git_branches({
    theme = 'default',
    layout_config = {
      prompt_position = 'top',
    },
    winblend = 5,
    sorting_strategy = 'ascending',
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<leader><CR>', function()
        createBranch(action_state.get_current_line())
        actions.close(prompt_bufnr)
      end)

      map('i', '<leader>d', function()
        local branch = action_state.get_selected_entry().value
        local should_delete = vim.fn.confirm(
          'Are you sure you want to delete this branch? It may contain unmerged changes!', 'Yes\nNo', 2)

        if should_delete == 1 then
          vim.cmd('Git branch -D ' .. branch)
          local should_delete_remote = vim.fn.confirm(
            'Do you want to delete the remote branch as well?', 'Yes\nNo', 2)

          if should_delete_remote == 1 then
            vim.cmd('Git push origin --delete ' .. branch)
          end

          -- Refresh the picker
          git_branches()
        end
      end)

      -- It's important to return true to keep Telescope's default mappings
      return true
    end,
  })
end

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", function()
  git_branches()
end)

vim.keymap.set('n', '<leader>s', function()
  if vim.bo.filetype ~= 'fugitive' then
    return
  end

  vim.cmd("G fetch | G Pull | G push --quiet")
end)
