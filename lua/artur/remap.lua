vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<S-[>", "<S-[>zz")
vim.keymap.set("n", "<S-]>", "<S-]>zz")

-- vim.keymap.set("i", "'", "''<Left>")
-- vim.keymap.set("i", '"', '""<Left>')
-- vim.keymap.set("i", '[', '[]<Left>')
-- vim.keymap.set("i", '{', '{}<Left>')

local function diagnostic_go_prev_center()
    vim.diagnostic.goto_prev()
    vim.cmd.normal('zz')
end

local function diagnostic_go_next_center()
    vim.diagnostic.goto_next()
    vim.cmd.normal('zz')
end

-- Diagnostic keymaps frmm init.lua
vim.keymap.set('n', '[d', diagnostic_go_prev_center,
    { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', diagnostic_go_next_center,
    { desc = 'Go to next diagnostic message' })
