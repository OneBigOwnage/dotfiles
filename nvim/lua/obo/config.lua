-- Make sure there's always at least 8 characters visible to the top and bottom of the screen
vim.o.scrolloff = 8

-- Relative line numbers
vim.o.relativenumber = true

-- Show current line number
vim.o.number = true

-- Highlight the current line number, but not the entire line.
vim.o.cursorlineopt = 'number'
vim.o.cursorline = true

vim.g.clipboard = {
  name = 'wsl-clipboard',
  copy = {
    ['+'] = { "clip.exe" },
    ['*'] = { "clip.exe" },
  },
  paste = {
    -- ['+'] = { "powershell.exe", "-c", "[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))" },
    -- ['*'] = { "powershell.exe", "-c", "[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))" },
    ['+'] = { "win32yank.exe", "-o", "--lf" },
    ['*'] = { "win32yank.exe", "-o", "--lf" },
  },
  cache_enabled = 0,
}

vim.o.clipboard = 'unnamedplus'

-- Autocommand to DO highlight all matches while searching,
-- but don't highlight matches after searching.
vim.cmd([[
  augroup vimrc-incsearch-highlight
    autocmd!

    autocmd CmdlineEnter /,\? :set hlsearch

    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END
]])

-- Highlight yanked text
vim.cmd([[
  augroup vimrc-highlight-yank
    autocmd!

    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 50 })
  augroup END
]])


-- Search without regex by default
vim.o.incsearch = true

-- Replace the (relative) line numbers with a sign when there is one.
vim.o.signcolumn = 'yes'

-- vim.cmd([[
--   augroup vimrc-clear-trailing-empty-lines
--     autocmd!
--
--     autocmd bufWritePre *.* $put _ | $;?\\(^\\s*$\\)\\@!?+1,$d
--
--     augroup END
-- ]])

-- Add new line to the end of the file
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   group = vim.api.nvim_create_augroup('UserOnSave', {}),
--   pattern = '*',
--   callback = function()
--     local n_lines = vim.api.nvim_buf_line_count(0)
--     local last_nonblank = vim.fn.prevnonblank(n_lines)
--     if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
--       last_nonblank, n_lines, true, { '' })
--     end
--   end,
-- })

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false })
  })
})

