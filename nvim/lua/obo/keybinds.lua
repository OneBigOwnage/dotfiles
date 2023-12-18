
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>v", vim.cmd.Ex)

-- Being able to move lines up and down
-- by holding Alt + either j or k,
-- both in visual and normal mode.
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_next);
vim.keymap.set("n", "<leader><C-d>", vim.diagnostic.goto_prev);

vim.keymap.set("n", "<leader>gp", "<cmd>Telescope prosession<CR>");

