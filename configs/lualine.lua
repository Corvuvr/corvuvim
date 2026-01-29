local config = function()

    local PALETTE_RED   = "#99110F"
    local PALETTE_GOLD  = "#E3C46F"
    local PALETTE_BROWN = "#332215"
    local PALETTE_WHITE = "#ffffff"
    local PALETTE_BLACK = "#000000"
    
    local custom_gruvbox = require('lualine.themes.gruvbox')
    
    -- Normal
    custom_gruvbox.normal  .a = { fg = PALETTE_GOLD,  bg = PALETTE_RED }
    custom_gruvbox.insert  .a = { fg = PALETTE_BLACK, bg = PALETTE_GOLD, gui = "bold" }
    custom_gruvbox.visual  .a = { fg = PALETTE_BLACK, bg = PALETTE_GOLD, gui = "bold" }
    custom_gruvbox.command .a = { fg = PALETTE_GOLD,  bg = PALETTE_RED }
    custom_gruvbox.inactive.a = { fg = PALETTE_BLACK, bg = PALETTE_GOLD, gui = "bold"  }

    custom_gruvbox.normal  .c = { fg = PALETTE_BLACK, bg = PALETTE_GOLD, gui = "bold" }
    custom_gruvbox.insert  .c = { fg = PALETTE_GOLD,  bg = PALETTE_RED   }
    custom_gruvbox.visual  .c = { fg = PALETTE_GOLD,  bg = PALETTE_BROWN }
    custom_gruvbox.command .c = { fg = PALETTE_GOLD,  bg = PALETTE_BLACK }
    custom_gruvbox.inactive.c = { fg = PALETTE_GOLD,  bg = PALETTE_BLACK }

    custom_gruvbox.normal  .y = { fg = PALETTE_GOLD, bg = PALETTE_RED }
    custom_gruvbox.insert  .y = { fg = PALETTE_GOLD, bg = PALETTE_BROWN }
    custom_gruvbox.visual  .y = { fg = PALETTE_GOLD, bg = PALETTE_RED }
    custom_gruvbox.command .y = { fg = PALETTE_GOLD, bg = PALETTE_RED }
    custom_gruvbox.inactive.y = { fg = PALETTE_GOLD, bg = PALETTE_RED }

    require('lualine').setup({
        options = { 
            -- theme = "carbonfox",
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
