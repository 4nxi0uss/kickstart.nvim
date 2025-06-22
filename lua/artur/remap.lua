vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<S-[>', '<S-[>zz')
vim.keymap.set('n', '<S-]>', '<S-]>zz')

-- vim.keymap.set("i", "'", "''<Left>")
-- vim.keymap.set("i", '"', '""<Left>')
-- vim.keymap.set("i", '[', '[]<Left>')
-- vim.keymap.set("i", '{', '{}<Left>')

-- Diagnostic keymaps frmm init.lua
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = vim.v.count1 }
  vim.cmd.normal 'zz'
end, { desc = 'Jump to the next diagnostic in the current buffer' })

vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -vim.v.count1 }
  vim.cmd.normal 'zz'
end, { desc = 'Jump to the previous diagnostic in the current buffer' })

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
