local M = {}

function M.setup()
    -- MAPPINGS
    vim.keymap.set('n', 'gp',           ':b#<CR>',               { desc = "Previously active buffer" })
    vim.keymap.set('n', '<S-Tab>',      ':bprev<CR>',            { desc = "Previous buffer" })
    vim.keymap.set('n', '<Tab>',        ':bnext<CR>',            { desc = "Next buffer" })
    vim.keymap.set('n', '<C-n>',        ':NvimTreeToggle<CR>',   { desc = "Tree toggle" })
    vim.keymap.set('n', '<leader>n',    ':NvimTreeOpen<CR>',     { desc = "Tree open" })
    vim.keymap.set('n', '<leader>x',    ':bd<CR>:bnext<CR>',     { desc = "Close buffer" })
    vim.api.nvim_set_keymap('i', '<C-e>',         '<End>',       { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<Esc><leader>', '<C-\\><C-n>', { noremap = true, silent = true })
    vim.keymap.set('n', '<F1>', function() vim.fn.setreg("+", vim.api.nvim_buf_get_name(0)) end, { desc = "Copy current buffer path to clipboard" })
end

return M
