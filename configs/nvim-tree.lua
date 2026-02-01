local config = function()

    local tree = require("nvim-tree")

    vim.keymap.set('n', '<C-n>', function() 
        vim.cmd("NvimTreeToggle") 
    end)
    
    vim.keymap.set('n', '<Space><n>', function() 
        vim.cmd("NvimTreeOpen") 
        vim.cmd("NvimTreeRefresh") 
    end)
    
    vim.keymap.set('n', 'h', function() 
        
        local nvim_tree_name = "NvimTree"
        local active_buffer_name = vim.fn.expand("%:t")
        if string.sub(active_buffer_name, 1, string.len(nvim_tree_name)) == nvim_tree_name then
            vim.cmd("vertical rightbelow help nvim-tree-mappings-default")
        end
    end)

    tree.setup({
        view = { adaptive_size = true },
        renderer = {
            highlight_git = "all",
        }
    })

    local PALETTE = require("colorscheme")

    vim.api.nvim_set_hl(0, "NvimTreeNormal",            { fg = PALETTE.SAND, bg = PALETTE.BLACK })
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",        { fg = PALETTE.CHERRY , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeFolderName",        { fg = PALETTE.CHERRY , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName",  { fg = PALETTE.CHERRY , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeRootFolder",        { fg = PALETTE.SAND, bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeSpecialFile",       { fg = PALETTE.SAND, underline = true })
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker",      { fg = PALETTE.SAND })
    vim.api.nvim_set_hl(0, "NvimTreeImageFile",         { fg = PALETTE.SAND })
    vim.api.nvim_set_hl(0, "NvimTreeSymlink",           { fg = PALETTE.SAND })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator",      { fg = PALETTE.BROWN, bg = PALETTE.BLACK })
    vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL",  { fg = "#777777"    })
end

return config
