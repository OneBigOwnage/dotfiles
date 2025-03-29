require("config")
require("keybinds")

-- Set runtime path to include lazy.nvim
vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lazy/lazy.nvim")

-- Load plugins from 'lua/plugins/'
require("lazy").setup("plugins")
