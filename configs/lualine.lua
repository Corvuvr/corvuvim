local config = function()

    local PALETTE = require("colorscheme")
    local custom_gruvbox = require('lualine.themes.gruvbox')
    
    -- Normal
    custom_gruvbox.normal  .a = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }
    custom_gruvbox.insert  .a = { fg = PALETTE.BLACK, bg = PALETTE.SAND, gui = "bold" }
    custom_gruvbox.visual  .a = { fg = PALETTE.BLACK, bg = PALETTE.SAND, gui = "bold" }
    custom_gruvbox.command .a = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }
    custom_gruvbox.inactive.a = { fg = PALETTE.BLACK, bg = PALETTE.SAND, gui = "bold"  }

    custom_gruvbox.normal  .c = { fg = PALETTE.BLACK, bg = PALETTE.SAND, gui = "bold" }
    custom_gruvbox.insert  .c = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY   }
    custom_gruvbox.visual  .c = { fg = PALETTE.SAND,  bg = PALETTE.BROWN }
    custom_gruvbox.command .c = { fg = PALETTE.SAND,  bg = PALETTE.BLACK }
    custom_gruvbox.inactive.c = { fg = PALETTE.SAND,  bg = PALETTE.BLACK }
    
    custom_gruvbox.normal  .y = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }
    custom_gruvbox.insert  .y = { fg = PALETTE.SAND,  bg = PALETTE.BROWN }
    custom_gruvbox.visual  .y = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }
    custom_gruvbox.command .y = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }
    custom_gruvbox.inactive.y = { fg = PALETTE.SAND,  bg = PALETTE.CHERRY }

    require('lualine').setup({
        options = { 
            theme = custom_gruvbox,
        },
        sections = {
            lualine_c = {{
                'filename', 
                path=1,
            }},
        },
        tabline = {
            lualine_a = {"buffers"},
        },
    })
end

return config
