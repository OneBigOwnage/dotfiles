local gs = require('gitsigns')

gs.setup({
    preview_config = {
        border = 'rounded',
        relative = 'cursor',
    }
})

vim.keymap.set('n', '<leader>hh', function()
    gs.preview_hunk()
end, { desc = 'Preview Git Hunk' })

vim.keymap.set('n', '<leader>hs', function()
    gs.stage_hunk()
end, { desc = 'Stage Git Hunk' })
