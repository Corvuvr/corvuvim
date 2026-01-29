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

    local PALETTE_RED   = "#99110F"
    local PALETTE_GOLD  = "#E3C46F"
    local PALETTE_BROWN = "#332215"
    local PALETTE_WHITE = "#ffffff"
    local PALETTE_BLACK = "#000000"

    vim.api.nvim_set_hl(0, "NvimTreeNormal",            { fg = PALETTE_GOLD, bg = PALETTE_BLACK })
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",        { fg = PALETTE_RED , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeFolderName",        { fg = PALETTE_RED , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName",  { fg = PALETTE_RED , bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeRootFolder",        { fg = PALETTE_GOLD, bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeSpecialFile",       { fg = PALETTE_GOLD, underline = true })
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker",      { fg = PALETTE_GOLD })
    vim.api.nvim_set_hl(0, "NvimTreeImageFile",         { fg = PALETTE_GOLD })
    vim.api.nvim_set_hl(0, "NvimTreeSymlink",           { fg = PALETTE_GOLD })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator",      { fg = PALETTE_BROWN, bg = PALETTE_BLACK })
    vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL",  { fg = "#777777"    })
end

return config
