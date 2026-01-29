local config = function() 
    vim.lsp.enable("clangd")
    vim.lsp.enable("pyright")
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
    vim.keymap.set('n', '<F3>', function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', '<F4>', function() vim.lsp.buf.implementation() end)
    vim.keymap.set('n', 'gd',   function() vim.lsp.buf.definition() end)
    vim.keymap.set('n', 'gi',   function() vim.lsp.buf.implementation() end)
end

return config
